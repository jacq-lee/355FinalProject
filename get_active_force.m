function [f_ce] = get_active_force(x3, x4, v_m)

% Inputs
% x3: normalized muscle length
% x4: activation of electrical stimulation
% v_m: normalized velocity of muscle (x3 dot)

% Output
% f_bar_ce: normalized active force generated


F_bar = 30; % Normalized static force

q_sf = x4; % Activation signal q(s,f) -- Assumed to be equal to x4 

% Relationship between force and length (eq 9) - Normalized muscle force length
f_Fl = exp(-40*(x3 - 0.95)^4 + (x3 - 0.95)^2);

% Relationship between muscle output force and speed (eq 10) - Normalized muscle force speed factor
f_Fv = 0.54*atan(5.69*v_m + 0.51) + 0.745;

f_ce = F_bar*q_sf*f_Fl*f_Fv;

end