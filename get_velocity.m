function [v_m] = get_velocity(x1, x2)

% Inputs
% x1: theta, ankle joint angular position
% x2: theta dot, ankle joint angular velocity
x1 = deg2rad(x1);

% Output
% v_m: normalized tibialis anterior muscle contraction velocity


alpha_P = deg2rad(9.6); % Pennation angle for the TA (feathering angle) (radians)
v_max = 2.5; % (m/s)

% Derivative of TA length with respect to ankle angle
deriv_l_mt = -(2*((3*cos(x1))/50 + (3*sin(x1))/100)*((3*cos(x1))/100 -...
    (3*sin(x1))/50 + 3/10) - 2*((3*cos(x1))/100 - (3*sin(x1))/50)*((3*cos(x1))/50 +...
    (3*sin(x1))/100 - 3/100))/(2*(((3*cos(x1))/100 - (3*sin(x1))/50 + 3/10)^2 +...
    ((3*cos(x1))/50 + (3*sin(x1))/100 - 3/100)^2)^(1/2));

v_m_not_norm = x2*deriv_l_mt*(1/cos(alpha_P)); % Non-normalized TA contraction velocity

v_m = v_m_not_norm/v_max;

end