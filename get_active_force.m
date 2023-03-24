function [f_bar_ce] = get_active_force(x_3, V_m_bar)

% Inputs
% 
F_bar = 30; %Normalized static force that is actually not really normalized?

q_sf = %unknown value, Activiation signal

%Relationship between force and length (eq 9)
F_tilda_Fl_l_m = exp(-40*(x_3 -0.95)^4 + (x_3 -0.95)^2);

%Relationship between muscle output force and speed (eq 10) 
F_tilda_Fv_V_m = 0.54*atan(5.69*V_m_bar + 0.51) + 0.745;



% Output
% f_bar_ce: active force generated

f_bar_ce = F_bar*q_sf*F_tilda_Fl_l_m*F_tilda_Fv_V_m;

end