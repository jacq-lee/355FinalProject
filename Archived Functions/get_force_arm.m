function [gamma_ma] = get_force_arm(x1)
% Archived function

% Inputs
% x1: theta, the ankle joint angle

% Output
% gamma_ma: force arm

%% Using the Force Arm versus Angle Curve

% gamma_ma_mm = -0.0069*(x1^2) + 0.769*x1 - 1.3602;
% 
% gamma_ma = gamma_ma_mm/1000;

%% Finding the average value between 5 and 45 degrees
% x1 = 5:45;
% gamma_ma = zeros(1, length(x1));
% 
% for i = 1:length(x1)
%     gamma_ma(i) = -0.0069*(x1(i)^2) + 0.769*x1(i) - 1.3602;
% end
% 
% average_length = mean(gamma_ma)/1000

%% Using a fixed force arm length

% gamma_ma = 0.0126; % average from 5 to 45 degrees
gamma_ma = 0.001;

end