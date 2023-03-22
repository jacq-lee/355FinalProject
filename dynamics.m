function [x_dot] = dynamics(x)

% Inputs
%  x: state vector (ankle angle, angular velocity, TA normalized length, activation)

% Output
% x_dot: derivative of state vector

% state equations
x_dot = x; % initialize x_dot
x_dot(1) = x(2); % theta dot (angular velocity)
x_dot(2) = (torque_sol - torque_ta - gravity_moment(x(1)))/ankle_inertia; % angular acceleration
x_dot(3) = get_velocity(tibialis_activation, x(3), norm_ltat); % normalized tibialis velocity
x_dot(4) =  % activation

end