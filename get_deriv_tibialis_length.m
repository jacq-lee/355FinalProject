function [deriv_l_mt] = get_deriv_tibialis_length(x1)

% Inputs
% x1 (theta): body angle (up from prone horizontal)

% Output
% tibialis anterior length (m)

%% Original Coordinate System

% % Convert x1 from paper's coordinate system to this coordinate system
% x1_adjusted = (pi/2) - x1;

%% Derive the TA Lengt wrt Ankle Angle - Original Coordinate System
% syms f(x)
% 
% % define rotation matrix
% rotation = [cos(x) -sin(x) 
%    sin(x) cos(x)];
% 
% % coordinates in global reference frame
% origin = rotation * [0.3 -0.03]';
% insertion = [0.06, -0.03]';
% 
% difference = origin - insertion;
% 
% f(x) = sqrt(difference(1)^2 + difference(2)^2);
% 
% dl_over_dtheta = diff(f,x)

% deriv_l_mt = double(dl_over_dtheta(x1));

%% Pre-Derived Function - Original Coordinate System
% deriv_l_mt = (2*((3*cos(x1_adjusted))/100 - (3*sin(x1_adjusted))/10)*((3*cos(x1_adjusted))/10 + (3*sin(x1_adjusted))/100 - 3/50) +...
%     2*((3*cos(x1_adjusted))/10 + (3*sin(x1_adjusted))/100)*((3*sin(x1_adjusted))/10 - (3*cos(x1_adjusted))/100 +...
%     3/100))/(2*(((3*cos(x1_adjusted))/10 + (3*sin(x1_adjusted))/100 - 3/50)^2 + ((3*sin(x1_adjusted))/10 -...
%     (3*cos(x1_adjusted))/100 + 3/100)^2)^(1/2));

%% Derive the TA Lengt wrt Ankle Angle - FSRF Coordinate System
% syms f(x)
% 
% % define rotation matrix
% rotation = [cos(x) -sin(x) 
%    sin(x) cos(x)];
% 
% % coordinates in global reference frame
% origin = [0.03, 0.3]';
% insertion = rotation * [0.06, -0.03]';
% 
% difference = origin - insertion;
% 
% f(x) = sqrt(difference(1)^2 + difference(2)^2);
% 
% dl_over_dtheta = diff(f,x)
% 
% % deriv_l_mt = double(dl_over_dtheta(x1));

%% Pre-Derived Function - FSRF System
deriv_l_mt = -(2*((3*cos(x1))/50 + (3*sin(x1))/100)*((3*cos(x1))/100 -...
    (3*sin(x1))/50 + 3/10) - 2*((3*cos(x1))/100 - (3*sin(x1))/50)*((3*cos(x1))/50 +...
    (3*sin(x1))/100 - 3/100))/(2*(((3*cos(x1))/100 - (3*sin(x1))/50 + 3/10)^2 +...
    ((3*cos(x1))/50 + (3*sin(x1))/100 - 3/100)^2)^(1/2));

end
