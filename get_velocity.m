function [v_m] = get_velocity(x1, x2)

% Inputs
% x1: theta, ankle joint angular position
% x2: theta dot, ankle joint angular velocity

% Output
% v_m: normalized tibialis anterior muscle contraction velocity


alpha_P = deg2rad(9.6); % Pennation angle for the TA (feathering angle) (radians)
v_max = 2.5; % (m/s)

syms symbolic_x1;

l_deriv = inline(diff(tibialis_length(symbolic_x1)));
v_m_not_norm = x2*l_deriv(x1)*(1/cos(alpha_P)); % Non-normalized TA contraction velocity

v_m = v_m_not_norm/v_max;

end