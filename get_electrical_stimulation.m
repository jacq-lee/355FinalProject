function [Q1_pw, Q2_f] = get_electrical_stimulation(pw, f)

% Inputs
% pw: pulse width (microseconds)
% f: electrical stimulation frequency (Hz)

% Output
% Q1_pw: electrical stimulation intensity
% Q2_f: electrical stimulation frequency 

pw_thr = % pulse width at the beginning of ankle dorsiflexion
pw_sat = % pulse width at the maximum angle (pw_sat > pw_thr)

a1 = 0.8323; 
a2 = 2.5; 
R = 15;
f_cf = 50; % critical fusion frequency, in Hertz

for

    if pw < pw_thr
        Q1_pw = 0;
    else if pw_thr <= pw || pw <= pw_sat
        Q1_pw = (pw - pw_thr)/(pw_sat - pw_thr);
    else
        Q1_pw = 1;

end

f0 = R*ln( (a2-1)*e^(f_cf/R) - a2 );

Q2_f = ( (a1 - a2)/(1 + e^((f - f0)/R)) ) + a2;


end