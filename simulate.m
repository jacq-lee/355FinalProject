function [] = simulate(T, muscle_model)
% Runs a simulation of the model and plots results.

% Inputs
% T: total time to simulate, in seconds
% muscle_model: The MuscleModel object

% assume tibialis rest length is when the person is standing (pi/2)
rest_length_tibialis = tibialis_length(pi/2); 

% MDM: Do we need something like the line below???
% tibialis = HillTypeMuscle(2000, 0.6*rest_length_tibialis, 0.4*rest_length_tibialis);


f = @(t, x) dynamics(x, muscle_model);
tspan = [0 T];

% MDM: Figure out initial conditions for states
% [ ankle angle, angular velocity, TA normalized length, activation ] 

x1_initial = 1.876;
norm_ta_initial = (tibialis_length(x1_initial))/150; % divided by 150 as this is lopt

initialCondition = [x1_initial, 0, norm_ta_initial, 0];

options = odeset('RelTol', 1e-6, 'AbsTol', 1e-8);
[time, state] = ode45(f, tspan, initialCondition, options);


angle_angle = y(:,1);
angular_velocity = y(:,2);
TA_normalized_length = y(:,3);
activation = y(:,4); 

% MDM: INTERESTING, here they calculate stuff based off of the states, is
% this something we should consider doing in our "simulations"?? is this
% what he meant when he said "what will you simulate?? 

% soleus_moment_arm = 0.05;
% tibialis_moment_arm = 0.03;
% soleus_moment = zeros(size(y,1),1);
% tibialis_moment = zeros(size(y,1),1);
% for i = 1:size(y,1)
%     soleus_moment(i) = soleus_moment_arm * soleus.get_force(soleus_length(theta(i)), soleus_norm_length_muscle(i));
%     tibialis_moment(i) = -tibialis_moment_arm * tibialis.get_force(tibialis_length(theta(i)), tibialis_norm_length_muscle(i));
% end

figure()
LineWidth = 1.5;
subplot(2,1,1)
plot(time, theta, 'LineWidth', LineWidth)
ylabel('Ankle Angle (rad)')

% 
% subplot(2,1,2)
% plot(time, soleus_moment, 'r', 'LineWidth', LineWidth), hold on
% plot(time, tibialis_moment, 'g', 'LineWidth', LineWidth)
% plot(time, gravity_moment(theta), 'k', 'LineWidth', LineWidth), hold off
% legend('Soleus', 'Tibialis', 'Gravity', 'Location','northwest')
% xlabel('Time (s)')
% ylabel('Torques (Nm)')
% set(gca,'FontSize',12)

end