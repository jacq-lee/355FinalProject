function [f_pe] = get_passive_force_parallel(x3)

% Inputs
% x3: Lm, normalized length of muscle (contractile element)

f_peak_iso = 1.3;
l_pe = 0.9;
% y = atan((0.1*(x3(n)-l_pe)-0.22)^10);

% Output
% f_pe: passive force when muscle fibre longer than resting length (due to
% parallel element)

if x3 < l_pe
   f_pe = 0;
else 
   f_pe = (f_peak_iso*atan((0.1*(x3-l_pe)-0.22)^10))
end

end
