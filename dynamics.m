function [x_dot] = dynamics(x)

% Inputs
%  x: state vector (ankle angle, angular velocity, TA normalized length, activation)

% Output
% x_dot: derivative of state vector

x_dot = zeros(size(x)); % initialize x_dot
m = 0; % JL: add
d = 0; % JL: add
g = 9.81; % JL: double check

% MDM: Unfatigued K values eye-balled from chart
k1 = 3;
k2 = 0;
k3 = 12; 

% rest_length_tibialis = tibialis_length*(pi/2);
% norm_tendon = we assume value

%L(theta) = l_mt = [origin - insertion] = lm + lt (non-normalized)
%l_mt = tibialis_length;  

% normalized lm is x3
% x(3) = (tibialis_length - (0.4*rest_length_tibialis*norm_tendon))/(0.6*rest_length_tibialis)
l_mt = 

[Q1_pw, Q2_f] = get_electrical_stimulation(pw, f);


x_dot(1) = x(2); % theta dot (angular velocity)
x_dot(2) = (m*g*d*sin(x(1) - k1*e^(k2*x1) + torque_t + torque_e + torque_v))/(m*d^2); % angular acceleration
x_dot(3) = get_velocity(x(1), x(2), l_mt); % normalized tibialis velocity
x_dot(4) = get_fes_activation(Q1_pw, Q2_f, k3, x(4)); % activation derivative

end