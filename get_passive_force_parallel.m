function [f_pe] = get_passive_force_parallel(x3)

% Inputs
% x3: lm, normalized length of muscle (contractile element)

f_peak_iso = 1.3; % normalized
l_pe = 0.9; % normalized
% y = atan((0.1*(x3(n)-l_pe)-0.22)^10);

% Output
% f_pe: passive force when muscle fibre longer than resting length (due to
% parallel element)

f_pe = zeros(1,length(x3));

for n = 1:1:length(x3)
   if x3(n) < l_pe
       f_pe(n) = 0;
   else 
       f_pe(n) = (f_peak_iso*atan((0.1*(x3(n)-l_pe)-0.22)^10));

   end
end

end