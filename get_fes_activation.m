% MDM
% TODO: 
% 1. Call get_electrical_stimulation() somewhere before this function is called
%    (maybe in the main file) so Q1_pw and Q2_f are initialized. 
% 2. Figure out best way to run different "simulations" and pass it
%    different k3 based on the simulation we run


function [fes_activation_fun] = get_fes_activation(Q1_pw, Q2_f, k3, x4)

% Inputs
% Q1_pw: electrical stimulation intensity
% Q2_f: electrical stimulation frequency 
% k3: FES intensity threshold for different individuals (identified through
%     EKF algorithm and variable input in simulation)
% x4: activation of electrical stimulation

% Output
% fes_activation_fun: function handle for activation equation (x_dot(3) equation)

c0 = 13.2; % value from literature, no unit provided (doi:10.1123/jab.17.2.113)
fes_activation_fun = @(x4) c0*(-x4 + Q1_pw*Q2_f + k3);

end