function ankle_geometry()

theta = deg2rad(-17);

% define rotation matrix
rotation = [cos(theta) -sin(theta) 
   sin(theta) cos(theta)];

% coordinates in global reference frame
origin = [0.03, 0.3]';
insertion = rotation * [0.06, -0.03]';

difference = origin - insertion;
tibialis_anterior_length = sqrt(difference(1)^2 + difference(2)^2)

% shank_x_og = [0, 0.03];
% shank_y_og = [0, 0.3];
foot_x_og = [0, 0.06];
foot_y_og = [0, -0.03];

shank_x = [0, origin(1)];
shank_y = [0, origin(2)];
foot_x = [0, insertion(1)];
foot_y = [0, insertion(2)];

% figure();
% scatter(0,0), hold on;
% scatter(0.3, -0.03);
% scatter(origin(1), origin(2));
% scatter(insertion(1), insertion(2)), hold off;

% grid on;
% legend('Ankle Center','OG Origin', 'Rotated Origin', 'Insertion')

figure();
plot(foot_x_og, foot_y_og), hold on;
plot(shank_x, shank_y);
plot(foot_x, foot_y), hold off;

axis equal
grid on;
legend('Unrotated Foot','Shank','Foot')


end