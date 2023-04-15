function [Q1_pw, Q2_f] = get_electrical_stimulation(pw, f)

% Inputs
% pw: pulse width (seconds)
% f: electrical stimulation frequency (Hz)

% Outputs
% Q1_pw: electrical stimulation intensity
% Q2_f: electrical stimulation frequency 


pw_thr = 0; % Pulse width at the beginning of ankle dorsiflexion (seconds)
pw_sat = 110e-6; % Pulse width at the maximum angle (pw_sat > pw_thr) (seconds)

a1 = 0.8323; 
a2 = 2.5; 
R = 15;
f_cf = 50; % Critical fusion frequency (Hz)

if pw < pw_thr
    Q1_pw = 0;
elseif (pw_thr <= pw && pw <= pw_sat)
    Q1_pw = (pw - pw_thr)/(pw_sat - pw_thr);
else
    Q1_pw = 1;
end

f0 = R*log( (a2-1)*exp(f_cf/R) - a2 );

Q2_f = ( (a1 - a2)/(1 + exp((f - f0)/R)) ) + a2;


end