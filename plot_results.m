function [] = plot_results(time, state, torque_t, torque_e)

% Separating the state vector
ankle_angle = state(:,1);
angular_velocity = state(:,2);
TA_normalized_length = state(:,3);
activation = state(:,4); 

% Other variables to be plotted
combined_torque = torque_t + torque_e;
joint_angle = rad2deg(ankle_angle).*(-1) + 90;
joint_angular_velocity = rad2deg(angular_velocity).*(-1);


%%% Plotting
LineWidth = 1.5;

% All States over Time, Radians, Normalized Length
figure()
plot(time, ankle_angle, 'r', 'LineWidth', LineWidth), hold on
plot(time, angular_velocity, 'g','LineWidth', LineWidth)
plot(time, TA_normalized_length, 'b', 'LineWidth',LineWidth)
plot(time, activation, 'k', 'LineWidth', LineWidth), hold off

title('States over Time')
xlabel('Time (s)')
grid on
legend('Ankle Angle (rad)', 'Angular Velocity (rad/s)', 'Normalized TA Length', 'FEA Activaton')


% Joint Angle over Time
figure()
plot(time, joint_angle, 'r', 'LineWidth', LineWidth)
title('Joint Angle over Time')
xlabel('Time (s)')
ylabel('Ankle Joint Angle (°)')
grid on


% Joint Angular Velocity over Time
figure()
plot(time, joint_angular_velocity, 'g', 'LineWidth', LineWidth)
title('Joint Angular Velocity over Time')
xlabel('Time (s)')
ylabel('Angular Velocity (°/s)')
grid on


% Torque versus Ankle Joint Angle
figure()
plot(joint_angle, combined_torque, 'r', 'LineWidth', LineWidth), hold on;
plot(joint_angle, torque_t, 'g', 'LineWidth', LineWidth);
plot(joint_angle, torque_e, 'b', 'LineWidth', LineWidth), hold off;

title('Torque versus Ankle Joint Angle')
xlabel('Ankle Joint Angle (°)')
ylabel('Torque (N*m)')
xlim([-10 30])
grid on
legend('Combined Torque', 'Active Torque', 'Passive Torque')


% Overall Torque versus Ankle Joint Angle
figure()
plot(joint_angle, combined_torque, 'r', 'LineWidth', LineWidth);

title('Overall Torque versus Ankle Joint Angle')
xlabel('Ankle Joint Angle (°)')
ylabel('Torque (N*m)')
xlim([-10 30])
grid on


% TA Length (x3)
figure()
plot(time, TA_normalized_length, 'b', 'LineWidth',LineWidth)
title('TA Length over Time')
xlabel('Time (s)')
ylabel('TA Length (Normalized)')
grid on

% Activation
figure()
plot(time, activation, 'k', 'LineWidth',LineWidth);

title('Activation over Time (x4)')
xlabel('Time (s)')
ylabel('Activation')
grid on

end