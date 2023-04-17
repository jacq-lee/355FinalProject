function [f_pe] = get_passive_force_parallel(x3)

% Inputs
% x3: lm, normalized length of muscle (contractile element)

% Output
% f_pe: passive force when muscle fibre longer than resting length (due to
% parallel element)


f_peak_iso = 1.3; % Normalized (m/m)
l_pe = 0.9; % Normalized (m/m)

if x3 < l_pe
    f_pe = 0;
else
    f_pe = f_peak_iso*atan( deg2rad((0.1*(x3 - l_pe) - 0.22)^10) );
end

end