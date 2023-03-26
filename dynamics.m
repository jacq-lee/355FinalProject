function [x_dot] = dynamics(x, muscle_model)

% Inputs
% x: state vector (ankle angle, angular velocity, TA normalized muscle length, activation)

% Output
% x_dot: derivative of state vector

x_dot = zeros(size(x)); % Initialize x_dot

m = muscle_model.foot_mass;
d = muscle_model.distance;

g = 9.81;

k1 = muscle_model.k1;
k2 = muscle_model.k2;
k3 = muscle_model.k3;

pw = muscle_model.pw;
f = muscle_model.f;

[torque_t, torque_e, torque_v] = get_torque(x, muscle_model);


[Q1_pw, Q2_f] = get_electrical_stimulation(pw, f);
c0 = 13.2; % value from literature, no unit provided (doi:10.1123/jab.17.2.113)


x_dot(1) = x(2); % Theta dot (angular velocity)

x_dot(2) = (m*g*d*sin(x(1) - k1*exp(k2*x(1)) + torque_t + torque_e + torque_v))/(m*d^2); % Angular acceleration

x_dot(3) = get_velocity(x(1), x(2)); % Normalized tibialis velocity

x_dot(4) = c0*(-x(4) + Q1_pw*Q2_f + k3);

end
