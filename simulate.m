function [] = simulate(T, muscle_model)
% Runs a simulation of the model and plots results.

% Inputs
% T: total time to simulate (seconds)
% muscle_model: The MuscleModel object (inform the simulation parameters)

% TA length at 110 degrees (optimal length for force generation)
l_opt = tibialis_length(1.919862177); 

% Finding initial conditions
x1_initial = 1.876; % Value obtained from literature (radians)
norm_ta_initial = (tibialis_length(x1_initial))/l_opt;

initialCondition = [x1_initial, 0, norm_ta_initial, 0]; % (angle, angular velocity, norm TA length, activation)

f = @(t, x) dynamics(x, muscle_model);
tspan = [0 T];

options = odeset('RelTol', 1e-3, 'AbsTol', 1e-8);
[time, state] = ode45(f, tspan, initialCondition, options);

ankle_angle = (state(:,1));
angular_velocity = state(:,2);
TA_normalized_length = state(:,3);
activation = state(:,4); 

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
legend('Ankle Angle', 'Angular Velocity', 'Normalized TA Length', 'FEA Activaton')

% All states, Degrees, Length (cm)
% plot(time, ankle_angle.*(180/pi), 'r', 'LineWidth', LineWidth), hold on
% plot(time, angular_velocity.*(180/pi), 'g','LineWidth', LineWidth)
% plot(time, TA_normalized_length.*34.91, 'b', 'LineWidth',LineWidth)
% plot(time, activation, 'k', 'LineWidth', LineWidth), hold off
% 
% title('States over Time')
% xlabel('Time (s)')
% legend('Ankle Angle', 'Angular Velocity', 'Normalized TA Length', 'FEA Activaton')

% Ankle Angle and Angular Velocity (x1, x2), Radians
figure()
plot(time, ankle_angle, 'r', 'LineWidth', LineWidth), hold on
plot(time, angular_velocity, 'g','LineWidth', LineWidth), hold off
title('Ankle Angle and Velocity over Time')
xlabel('Time (s)')
ylabel('Angle (Radians)')
legend('Ankle Angle (x1)', 'Angular Velocity (x2)')

% TA Length (x3)
figure()
plot(time, TA_normalized_length, 'b', 'LineWidth',LineWidth)
title('TA Length over Time')
xlabel('Time (s)')
ylabel('TA Length (Normalized)')
legend('TA Length (x3)')

end