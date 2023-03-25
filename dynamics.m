function [x_dot] = dynamics(x, muscle_model)

% Inputs
%  x: state vector (ankle angle, angular velocity, TA normalized length, activation)

% Output
% x_dot: derivative of state vector

x_dot = zeros(size(x)); % initialize x_dot
% m = 52; % MDM: Selected Subject 1 for now (kg)
% d = 0.25; % MDM: Selected Subject 1 for now (m)

m = muscle_model.mass;
d = muscle_model.d;

g = 9.81;



% MDM: Unfatigued K values eye-balled from chart
% k1 = 3;
% k2 = 0;
% k3 = 12; 

k1 = muscle_model.k1;
k2 = muscle_model.k2;
k3 = muscle_model.k3;

pw = muscle_model.pw;
f = muscle_model.f;

% rest_length_tibialis = tibialis_length*(pi/2);
% norm_tendon = rest_length_tibialis - (0.6*rest_length_tibialis*x3)

%L(theta) = l_mt = [origin - insertion] = lm + lt (non-normalized) 

% normalized lm is x3
% x(3) = (tibialis_length(x(1)) - (0.4*rest_length_tibialis*norm_tendon))/(0.6*rest_length_tibialis)

[torque_t, torque_e, torque_v] = get_torque(x, muscle_model);

l_mt = tibialis_length(x(1));
l_opt = 150; % (mm)

[Q1_pw, Q2_f] = get_electrical_stimulation(pw, f);


x_dot(1) = x(2); % theta dot (angular velocity)
x_dot(2) = (m*g*d*sin(x(1) - k1*e^(k2*x1) + torque_t + torque_e + torque_v))/(m*d^2); % angular acceleration
x_dot(3) = get_velocity(x(1), x(2), l_mt)/l_opt; % normalized tibialis velocity
x_dot(4) = c0*(-x(4) + Q1_pw*Q2_f + k3);
% x_dot(4) = get_fes_activation(Q1_pw, Q2_f, k3); % activation derivative

end
