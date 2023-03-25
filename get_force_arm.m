function [gamma_ma] = get_force_arm(x1)

% Inputs
% x1: theta, the ankle joint angle

% Output
% gamma_ma: force arm

gamma_ma = -0.0069.*x1.^2 + 0.769.*x1 - 1.3602;

end