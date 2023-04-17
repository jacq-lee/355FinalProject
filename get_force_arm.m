function [gamma_ma] = get_force_arm(x1)
% Archived function

% Inputs
% x1: theta, the ankle joint angle

% Output
% gamma_ma: force arm


%% Using the Force Arm versus Angle Curve

% gamma_ma_mm = -0.0069*(x1^2) + 0.769*x1 - 1.3602;
% 
% gamma_ma = abs(gamma_ma_mm/1000);


%% Using a fixed force arm length

gamma_ma = 0.001; % force arm length when foot is close to resting position

end