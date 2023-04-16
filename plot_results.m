function [] = plot_results(time, state, torque_t, torque_e)

% Separating the state vector
ankle_angle = state(:,1);
angular_velocity = state(:,2);
TA_normalized_length = state(:,3);
activation = state(:,4); 

combined_torque = torque_t + torque_e;

%%% Plotting
LineWidth = 1.5;

% All States over Time, Degrees, Normalized Length
figure()
plot(time, ankle_angle, 'r', 'LineWidth', LineWidth), hold on
plot(time, angular_velocity, 'g','LineWidth', LineWidth)
plot(time, TA_normalized_length, 'b', 'LineWidth',LineWidth)
plot(time, activation, 'k', 'LineWidth', LineWidth), hold off

title('States over Time')
xlabel('Time (s)')
grid on
legend({'Ankle Angle (°)', 'Angular Velocity (°/s)', 'Normalized TA Length', 'FEA Activaton'},...
    'Location','southeast')


% Ankle Angle over Time
figure()
plot(time, ankle_angle, 'r', 'LineWidth', LineWidth)
title('Ankle Angle over Time')
xlabel('Time (s)')
ylabel('Ankle Joint Angle (°)')
grid on

% Ankle Angular Velocity over Time
figure()
plot(time, angular_velocity, 'g', 'LineWidth', LineWidth)
title('Ankle Angular Velocity over Time')
xlabel('Time (s)')
ylabel('Angular Velocity (°/s)')
grid on

% Torque versus Ankle Joint Angle
figure()
plot(ankle_angle, combined_torque, 'r', 'LineWidth', LineWidth), hold on;
plot(ankle_angle, torque_t, 'g', 'LineWidth', LineWidth);
plot(ankle_angle, torque_e, 'b', 'LineWidth', LineWidth), hold off;

title('Torque versus Ankle Joint Angle')
xlabel('Ankle Joint Angle (°)')
ylabel('Torque (N*m)')
% xlim([-10 30])
grid on
legend({'Combined Torque', 'Active Torque', 'Passive Torque'},'Location','southeast')

% Validation: Torque versus Ankle Joint Angle
literatureData = readtable('TorquevsAngle.csv');
literatureData = renamevars(literatureData, ["Var1", "Var2"], ["angle", "torque"]);
figure()
plot(ankle_angle, combined_torque, 'r', 'LineWidth', LineWidth), hold on;
plot(literatureData.angle, literatureData.torque, 'k', 'LineWidth', LineWidth), hold off;

title('Validation: Torque versus Ankle Joint Angle')
xlabel('Ankle Joint Angle (°)')
ylabel('Torque (N*m)')
grid on
legend({'Combined Torque','Zhang et Al Simulated Torque'},'Location','northeast')

% Torque over Time
figure()
plot(time, combined_torque, 'r', 'LineWidth', LineWidth), hold on;
plot(time, torque_t, 'g', 'LineWidth', LineWidth), hold on;
plot(time, torque_e, 'b', 'LineWidth', LineWidth), hold off;

title('Torque over Time')
xlabel('Time (s)')
ylabel('Torque (N*m)')
xlim([0 0.1])
grid on
legend({'Combined Torque', 'Active Torque', 'Passive Torque'},'Location','southeast')

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