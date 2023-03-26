function [] = simulate(T, muscle_model)
% Runs a simulation of the model and plots results.

% Inputs
% T: total time to simulate (seconds)
% muscle_model: The MuscleModel object (inform the simulation parameters)

% TA length at 110 degrees (optimal length for force generation)

l_opt = 0.6*tibialis_length(1.919862177);

% Finding initial conditions
x1_initial = 1.876; % Value obtained from literature (radians)
norm_ta_initial = (0.6*tibialis_length(x1_initial))/l_opt;

initialCondition = [x1_initial, 0, norm_ta_initial, 0]; % (angle, angular velocity, norm TA muscle length, activation)

f = @(t, x) dynamics(x, muscle_model);
tspan = [0 T];

% Integrate
options = odeset('RelTol', 1e-6, 'AbsTol', 1e-8);
[time, state] = ode45(f, tspan, initialCondition, options);

% Separating the state vector
ankle_angle = (state(:,1));
angular_velocity = state(:,2);
TA_normalized_length = state(:,3);
activation = state(:,4); 

% Other variables to be plotted
[torque_t, torque_e] = get_torque_vector(state, muscle_model);
combined_torque = torque_t + torque_e;
joint_angle = rad2deg(ankle_angle).*(-1) + 90;
joint_angular_velocity = rad2deg(angular_velocity).*(-1);


%%% Plotting
figure()
LineWidth = 1.5;


% All states, Radians, Normalized Length
plot(time, ankle_angle, 'r', 'LineWidth', LineWidth), hold on
plot(time, angular_velocity, 'g','LineWidth', LineWidth)
plot(time, TA_normalized_length, 'b', 'LineWidth',LineWidth)
plot(time, activation, 'k', 'LineWidth', LineWidth), hold off

title('States over Time')
xlabel('Time (s)')
grid minor
legend('Ankle Angle', 'Angular Velocity', 'Normalized TA Length', 'FEA Activaton')


% Ankle Angle and Angular Velocity (x1, x2), Radians
% figure()
% plot(time, ankle_angle, 'r', 'LineWidth', LineWidth), hold on
% plot(time, angular_velocity, 'g','LineWidth', LineWidth), hold off
% title('Ankle Angle and Velocity over Time')
% xlabel('Time (s)')
% ylabel('Angle (Radians)')
% grid minor
% legend('Ankle Angle (x1)', 'Angular Velocity (x2)')


% Joint Angle over Time
figure()
plot(time, joint_angle, 'r', 'LineWidth', LineWidth)
title('Joint Angle over Time')
xlabel('Time (s)')
ylabel('Ankle Joint Angle (Degrees)')
grid minor


% Joint Angular Velocity over Time
figure()
plot(time, joint_angular_velocity, 'r', 'LineWidth', LineWidth)
title('Joint Angular Velocity over Time')
xlabel('Time (s)')
ylabel('Angular Velocity (Degrees/s)')
grid minor


% Torque versus Ankle Joint Angle
figure()
plot(joint_angle, combined_torque, 'r', 'LineWidth', LineWidth), hold on;
plot(joint_angle, torque_t, 'g', 'LineWidth', LineWidth);
plot(joint_angle, torque_e, 'b', 'LineWidth', LineWidth), hold off;

title('Torque versus Ankle Joint Angle')
xlabel('Ankle Joint Angle (Degrees)')
ylabel('Torque (N*m)')
grid minor
legend('Combined Torque', 'Active Torque', 'Passive Torque')


% TA Length (x3)
figure()
plot(time, TA_normalized_length, 'b', 'LineWidth',LineWidth)
title('TA Length over Time')
xlabel('Time (s)')
ylabel('TA Length (Normalized)')
grid minor
legend('TA Length (x3)')

end