function [] = plot_compare(time_a, state_a, time_b, state_b, name_a, name_b)

% Separating state vector A
ankle_angle_a = state_a(:,1);
angular_velocity_a = state_a(:,2);
TA_normalized_length_a = state_a(:,3);
activation_a = state_a(:,4); 

% Separating state vector B
ankle_angle_b = state_b(:,1);
angular_velocity_b = state_b(:,2);
TA_normalized_length_b = state_b(:,3);
activation_b = state_b(:,4); 

% Joint angle
joint_angle_a = rad2deg(ankle_angle_a).*(-1) + 90;
joint_angle_b = rad2deg(ankle_angle_b).*(-1) + 90;
joint_angular_velocity_a = rad2deg(angular_velocity_a).*(-1);
joint_angular_velocity_b = rad2deg(angular_velocity_b).*(-1);


%%% Plotting
LineWidth = 1.5;


% All States over Time
figure()
plot(time_a, ankle_angle_a, 'r', 'LineStyle', '-', 'LineWidth', LineWidth), hold on
plot(time_a, angular_velocity_a, 'r', 'LineStyle', '--', 'LineWidth', LineWidth)
plot(time_a, TA_normalized_length_a, 'r', 'LineStyle', ':', 'LineWidth', LineWidth)
plot(time_a, activation_a, 'r', 'LineStyle', '-.', 'LineWidth', LineWidth)

plot(time_b, ankle_angle_b, 'b', 'LineStyle', '-', 'LineWidth', LineWidth-0.5)
plot(time_b, angular_velocity_b, 'b', 'LineStyle', '--', 'LineWidth', LineWidth-0.5)
plot(time_b, TA_normalized_length_b, 'b', 'LineStyle', ':', 'LineWidth', LineWidth-0.5)
plot(time_b, activation_b, 'b', 'LineStyle', '-.', 'LineWidth', LineWidth-0.5), hold off

title('States over Time')
xlabel('Time (s)')
grid on
legend('Ankle Angle (rad)', 'Angular Velocity (rad/s)', 'Normalized TA Length', 'FEA Activaton')

% Joint Angle over Time
figure()
plot(time_a, joint_angle_a, 'r', 'LineWidth', LineWidth), hold on
plot(time_b, joint_angle_b, 'b', 'LineWidth', LineWidth), hold off

title('Joint Angle over Time (x1)')
xlabel('Time (s)')
ylabel('Ankle Joint Angle (°)')
grid on
legend(name_a, name_b)


% Joint Angular Velocity over Time
figure()
plot(time_a, joint_angular_velocity_a, 'r', 'LineWidth', LineWidth), hold on
plot(time_b, joint_angular_velocity_b, 'b', 'LineWidth', LineWidth), hold off

title('Joint Angular Velocity over Time (x2)')
xlabel('Time (s)')
ylabel('Angular Velocity (°/s)')
grid on
legend(name_a, name_b)


% TA Length
figure()
plot(time_a, TA_normalized_length_a, 'r', 'LineWidth',LineWidth), hold on
plot(time_b, TA_normalized_length_b, 'b', 'LineWidth',LineWidth), hold off

title('TA Length over Time (x3)')
xlabel('Time (s)')
ylabel('TA Length (Normalized)')
grid on
legend(name_a, name_b)


% Activation
figure()
plot(time_a, activation_a, 'r', 'LineWidth',LineWidth), hold on
plot(time_b, activation_b, 'b', 'LineWidth',LineWidth), hold off

title('Activation over Time (x4)')
xlabel('Time (s)')
ylabel('Activation')
grid on
legend(name_a, name_b)

end