function [f_ce] = get_active_force(x3, x4, v_m)

% Inputs
% x3: normalized muscle length
% x4: Activation of electrical stimulation
% v_m: normalized velocity of muscle

% Output
% f_bar_ce: normalized active force generated


F_bar = 30; % EB: Normalized static force that is actually not really normalized?

v_max = 2.5; % (m/s)
vm_norm = v_m / v_max;

q_sf = x4; % Activation signal q(s,f) - assumed to be equal to x4 

% Relationship between force and length (eq 9) - Normalized muscle force length
f_Fl = exp(-40*(x3 -0.95)^4 + (x3 -0.95)^2);

% Relationship between muscle output force and speed (eq 10) - Normalized muscle force speed factor
f_Fv = 0.54*atan(5.69*vm_norm + 0.51) + 0.745;
% f_Fv = 0.54*atan(5.69*v_m + 0.51) + 0.745;

f_ce = F_bar*q_sf*f_Fl*f_Fv;

end