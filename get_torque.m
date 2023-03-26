function [torque_t, torque_v, torque_e] = get_torque(x, muscle_model)

% Inputs
% x1: theta, the ankle joint angle
% muscle_model: muscle model object
% q_dot -- Needed for torque_v, to be incorporated if time permits

% Outputs
% torque_t: active torque from electrical stimulation
% torque_v: passive torque from muscles viscous force
% torque_e: passive torque from elastic force


% Passive torque parameters, obtained from paper
a_1k = 2.1016;
b_1k = -0.0843;
a_2k = -7.9763;
b_2k = 0.1949;
c = -1.792;
K = -1;
d = 0.1;
n = 0.099;

% lt_norm = norm_length_tendon(obj, length_muscle_tendon_unit, normalized_muscle_length (x3))
lt_norm = muscle_model.norm_tendon_length(tibialis_length(x(1)), x(3)); % normalized length of muscle tendon

gamma_ma = get_force_arm(x(1));
v_m = get_velocity(x(1), x(2));

% f_t = f_ce + f_see + f_pe
% debug_getactive = get_active_force(x(3), v_m, x(4))
% debug_getseries = get_passive_force_series(lt_norm)
% debug_getparallel = get_passive_force_parallel(x(3))
f_t = get_active_force(x(3), v_m, x(4)) + get_passive_force_series(lt_norm) + get_passive_force_parallel(x(3));

torque_t = gamma_ma*f_t; 

% torque_v = K*sign(q_dot)*(d*abs(q_dot))^n;
torque_v = 0; % JL: Figure out if time permits

torque_e = exp(a_1k + b_1k*x(1)) - exp(a_2k + b_2k*x(1)) + c;


end