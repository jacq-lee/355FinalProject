function [tibialis_anterior_length] = tibialis_length(x1)

% Inputs
% x1 (theta): body angle (up from prone horizontal)
x1 = deg2rad(x1);

% Output
% tibialis anterior length (m)

%% Original Coordinate System

% % Convert x1 from paper's coordinate system to this coordinate system
% x1_adjusted = (pi/2) - x1;
% 
% % define rotation matrix
% rotation = [cos(x1_adjusted) -sin(x1_adjusted) 
%    sin(x1_adjusted) cos(x1_adjusted)];
% 
% % coordinates in global reference frame
% origin = rotation * [0.3 -0.03]';
% insertion = [0.06, -0.03]';
% 
% difference = origin - insertion;
% tibialis_anterior_length = sqrt(difference(1)^2 + difference(2)^2);

%% Modified Coordinate System - Fixed Shank and Rotating Foot (FSRF)

% define rotation matrix
rotation = [cos(x1) -sin(x1) 
   sin(x1) cos(x1)];

% coordinates in global reference frame
origin = [0.03, 0.3]';
insertion = rotation * [0.06, -0.03]';

difference = origin - insertion;
tibialis_anterior_length = sqrt(difference(1)^2 + difference(2)^2);

end
