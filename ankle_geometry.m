function ankle_geometry(x1)

x1 = deg2rad(x1);

% define rotation matrix
rotation = [cos(x1) -sin(x1) 
   sin(x1) cos(x1)];

% coordinates in global reference frame
origin = [0.03, 0.3]';
insertion = rotation * [0.06, -0.03]';

foot_x_og = [0, 0.06];
foot_y_og = [0, -0.03];

shank_x = [0, origin(1)];
shank_y = [0, origin(2)];
foot_x = [0, insertion(1)];
foot_y = [0, insertion(2)];

plot(foot_x_og, foot_y_og, 'Color', '#4DBEEE'), hold on;
plot(shank_x, shank_y);
plot(foot_x, foot_y, 'Color', '#0072BD'), hold off;

axis([-0.15 0.20 -0.05 0.3])
xlabel('x (m)')
ylabel('y (m)')
title('Ankle Geometry Visualization')
title(sprintf('Ankle Geometry Visualization\nAngle: %0.1f °', rad2deg(x1)));
grid on;
legend('Resting Foot Position','Shank','Foot')


end