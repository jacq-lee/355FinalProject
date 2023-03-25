function [v_m] = get_velocity(x1, x2)

% Inputs
% x1: theta, ankle joint angular position
% x2: theta dot, ankle joint angular velocity
% l_mt: the length of the tendon plus the muscle fibre

% Output
% v_m: tibialis anterior muscle contraction velocity (not normalized)

alpha_P = 9.6; % pennation angle for the TA (feathering angle) (degrees)
l_mt = tibialis_length(x1)


step_size = 0.001;

syms symbolic_x1

l_deriv = inline(diff(tibialis_length(symbolic_x1)))
v_m = x2*l_deriv(x1)*(1/cos(alpha_P)); % ta contraction velocity
end