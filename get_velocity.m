function [v_m] = get_velocity(x1, x2)

% Inputs
% x1: theta, ankle joint angular position
% x2: theta dot, ankle joint angular velocity
% l_mt: the length of the tendon plus the muscle fibre

% Output
% v_m: normalized tibialis anterior muscle contraction velocity

alpha_P = deg2rad(9.6); % pennation angle for the TA (feathering angle) (radians)
% l_mt = tibialis_length(x1);
v_max = 2.5; % (m/s)


% step_size = 0.001;

syms symbolic_x1

% l_deriv = inline(diff(tibialis_length(symbolic_x1)))
% v_m = x2*l_deriv(x1)*(1/cos(alpha_P)); % ta contraction velocity

l_deriv = inline(diff(tibialis_length(symbolic_x1)));
v_m = x2*l_deriv(x1)*(1/cos(alpha_P)); % non-normalized ta contraction velocity
% v_m_not_norm = x2*l_deriv(x1)*(1/cos(alpha_P)); % non-normalized ta contraction velocity

% v_m = v_m_not_norm/v_max;

end