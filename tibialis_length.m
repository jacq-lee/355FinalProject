function [tibialis_anterior_length] = tibialis_length(x1)

% Inputs
% x1 (theta): body angle (up from prone horizontal)

% Output
% tibialis anterior length (m)

% Convert x1 from paper's coordinate system to this coordinate system
x1_adjusted = (pi/2) - x1;

% define rotation matrix
rotation = [cos(x1_adjusted) -sin(x1_adjusted) 
   sin(x1_adjusted) cos(x1_adjusted)];

% coordinates in global reference frame
origin = rotation * [0.3 -0.03]';
insertion = [0.06, -0.03]';

difference = origin - insertion;
tibialis_anterior_length = sqrt(difference(1)^2 + difference(2)^2);

%% Zhang et al. Coordinate System

% p_shank_o_ta = [-0.0155, 0.2175, 0.0134]; % calf origin of TA
% p_shank_oeff_ta = [0.0256, 0.0257, -0.0093]; % effective calf connection point of TA
% p_foot_ieff_ta = [0.0757, -0.0420, -0.0196]; % effective foot connection point of TA
% p_foot_i_ta = [0.1850, -0.0510, -0.0330]; % foot endpoint of TA
% p_foot_i_sol = [-0.0365, -0.0288, 0.0056]; % foot endpoint of SOL
% 
% p_global_i_ta = 
% p_global_o_ta = 
% 
% tibialis_anterior_length = p_foot_ieff_ta - p_global_i_ta + p_shank_oeff_ta - p_global_o_ta

%%
% 
% theta = deg2rad(-200):0.05:deg2rad(200)
% lengthta = zeros(size(theta));
% derivative = zeros(size(theta));
% 
% deriv_l_mt = @get_deriv_tibialis_length;
% 
% for i = 1:1:max(size(theta))
%     x1 = theta(i);
%     rotation = [cos(x1) -sin(x1) 
%     sin(x1) cos(x1)];
% 
%     % coordinates in global reference frame
%     origin = rotation * [0.3 -0.03]';
%     insertion = [0.06, -0.03]';
%     
%     difference = origin - insertion;
%     lengthta(i) = sqrt(difference(1)^2 + difference(2)^2);
%     derivative(i) = deriv_l_mt(x1);
%     
% end
% 
% theta = rad2deg(theta);
% figure
% plot(theta, lengthta), hold on;
% plot(theta, derivative), hold off;
% legend('Length', 'Rate of Change')
% xlabel('x1 (degrees)')
% ylabel('TA Length')
% grid on;

end
