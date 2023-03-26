%% Simulation 1
% small pw (50 microseconds)
% frequency - 25 Hz
% no fatigue

clear
clc
resting_length_muscle = tibialis_length(pi/2)*0.6;
resting_length_tendon = tibialis_length(pi/2)*0.4;

T = 0.41; % can be changed

simulation_1 = MuscleModel(100, 0.0137, 0.25,3,0,12,50e-6,25, resting_length_muscle, resting_length_tendon);
simulate(T, simulation_1);

%% Simulation 2
% large pw (110 microseconds)
% frequency - 25 Hz
% no fatigue
clc

resting_length_muscle = tibialis_length(pi/2)*0.6;
resting_length_tendon = tibialis_length(pi/2)*0.4;

simulation_2 = MuscleModel(100,0.25,3,0,12,110e-6,25,resting_length_muscle, resting_length_tendon);
T = 10; % can be changed
simulate(T, simulation_2);
