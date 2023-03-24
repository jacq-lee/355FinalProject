function [v_m] = get_velocity(x1, x2, l_mt)

% Inputs
% theta: x1, ankle joint angular position
% theta_dot: x2, ankle joint angular velocity
% l_mt: the length of the tendon plus the muscle fibre

% Output
% v_m: tibialis anterior muscle contraction velocity

alpha_P = 9.6; % pennation angle for the TA (feathering angle)
l_deriv = diff(l_mt, x1); % derivative of muscle tendon unit wrt x1
v_m = x2*l_deriv*(1/cos(alpha_P)); % ta contraction velocity
end