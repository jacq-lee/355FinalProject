function [x_dot] = dynamics(x)

% Inputs
%  x: state vector (ankle angle, angular velocity, TA normalized length, activation)

% Output
% x_dot: derivative of state vector

x_dot = x; % initialize x_dot

% state equations from A2 (MDM: placeholders for now)
x_dot(1) = x(2); % theta dot (angular velocity) - MDM: same as paper
x_dot(2) = (torque_sol - torque_ta - gravity_moment(x(1)))/ankle_inertia; % angular acceleration - MDM: will change
x_dot(3) = get_velocity(tibialis_activation, x(3), norm_ltat); % normalized tibialis velocity - MDM: will change
x_dot(4) =  % activation

% MDM - work for x_dot(3)

% INITIAL WORK = BADD!!!!!
% c0 = 13.2; % value from literature (doi:10.1123/jab.17.2.113)
% [Q1_pw, Q2_f] = get_electrical_stimulation(pw, f);
% x_dot(3) = c0*(-x(3) + Q1_pw*Q2_f + k3);

%       OR
% CLEANER WORK = FUNCTION HANDLER!!!!
% [Q1_pw, Q2_f] = get_electrical_stimulation(pw, f);
% x_dot(3) = get_fes_activation(Q1_pw, Q2_f, k3, x(3));

end