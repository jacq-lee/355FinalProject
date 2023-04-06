% Unit testing for simulation #1 - change this section to check other simulations

% Type result = runtests('unit_tests') into command window to run tests
% Type rt = table(result) to view a table of the results

resting_length_muscle = tibialis_length(pi/2)*0.6;
resting_length_tendon = tibialis_length(pi/2)*0.4;
T = 0.41; 
x1_initial = 1.876;
simulation_1 = MuscleModel(52,0.0137,0.03475,3,0,12,50e-6,25, ...
    resting_length_muscle,resting_length_tendon);
[t1, state1, t_t1, t_e1] = simulate(T, simulation_1, x1_initial);

%% Test initial ankle angle (x1)
assert((x1_initial > 1) && (x1_initial < 2.5), ...
    "Initial ankle angle is unrealistic")

%% Test mass of individual
assert(simulation_1.mass > 20, "Mass of the individual is too small")

%% Test foot mass ratio
assert(simulation_1.foot_mass_ratio == 0.0137 || 0.0129, ...
    "Foot mass ratio is incorrect")

%% Test foot distance
assert((simulation_1.distance > 0.01) && (simulation_1.distance < 0.1), ...
    "Distance from ankle to centroid of foot is unrealistic")

%% Test pulse width
assert(simulation_1.pw >= 0, "FES pulse width cannot be negative")

%% Test frequency
assert(simulation_1.f >= 0, "FES frequency cannot be negative")

%% Test k1 input
assert(simulation_1.k1 == 3, "k1 value is incorrect")

%% Test k2 input
assert(simulation_1.k2 == 0 || 0.5, "k2 value is incorrect")

%% Test k3 input
assert(simulation_1.k3 == 12 || 13, "k3 value is incorrect")

%% Test resting muscle length
assert((resting_length_muscle > 0) && (resting_length_muscle < 1), ...
    "resting_length_muscle is an unrealistic number")

%% Test resting tendon length
assert((resting_length_tendon > 0) && (resting_length_tendon < 1), ...
    "resting_length_tendon is an unrealistic number")

%% Test state1 is a matrix
assert(ismatrix(state1), "State vector must be a matrix")

%% Test t1 is a matrix
assert(ismatrix(t1), "t1 must be a matrix")

%% Test t_t1 is a matrix
assert(ismatrix(t_t1), "t_t1 must be a matrix")

%% Test t_e1 is a matrix
assert(ismatrix(t_e1), "t_e1 must be a matrix")

%% Test t_t1 and t_e1 are equal in size
assert(isequal(size(t_t1), size(t_e1)), "t_t1 and t_e1 should be the same size")
