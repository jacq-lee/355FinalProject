function [torque_t, torque_e] = get_torque_vector(x, muscle_model)

% Inputs
% x: state vector (ankle angle, angular velocity, TA normalized length, activation)
% muscle_model: MuscleModel object
% q_dot -- Needed for torque_v, not currently implemented

% Outputs
% torque_t: active torque from electrical stimulation
% torque_e: passive torque from elastic force


% torque_e parameters, obtained from paper
a_1k = 2.1016;
b_1k = -0.0843;
a_2k = -7.9763;
b_2k = 0.1949;
c = -1.792;


torque_t = zeros(1, length(x));
torque_e = zeros(1, length(x));
lt_norm = zeros(1, length(x));
gamma_ma = zeros(1, length(x));
v_m = zeros(1, length(x));
f_t = zeros(1, length(x));

for n = 1:length(x)
    % lt_norm = norm_length_tendon(obj, length_muscle_tendon_unit, normalized_muscle_length (x3))
    lt_norm(n) = muscle_model.norm_tendon_length(tibialis_length(x(n,1)), x(n,3)); % Normalized length of muscle tendon
    
    gamma_ma(n) = get_force_arm(x(n,1));
    
    v_m(n) = get_velocity(x(n,1), x(n,2));
    
    % f_t = f_ce + f_see + f_pe
    f_t(n) = get_active_force(x(n,3), v_m(n), x(n,4)) + get_passive_force_series(lt_norm(n)) + get_passive_force_parallel(x(n,3));
    
    
    torque_t(n) = gamma_ma(n)*f_t(n); 
        
    torque_e(n) = exp(a_1k + b_1k*x(n,1)) - exp(a_2k + b_2k*x(n,1)) + c;

end

end