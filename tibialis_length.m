function [tibialis_anterior_length] = tibialis_length(x1)

% Inputs
% x1 (theta): body angle (up from prone horizontal)

% Output
% tibialis anterior length (m)

% define rotation matrix
rotation = [cos(x1) -sin(x1) 
   sin(x1) cos(x1)];

% coordinates in global reference frame
origin = rotation * [0.3 -0.03]';
insertion = [0.06, -0.03]';

difference = origin - insertion;
tibialis_anterior_length = sqrt(difference(1)^2 + difference(2)^2);


end
