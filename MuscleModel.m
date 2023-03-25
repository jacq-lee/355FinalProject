classdef MuscleModel
    % Muscle mode
    % dynamic model is defined in terms of normalized length and velocity.
    % To model a particular muscle, scale factors are needed for force, CE
    % length, and SE length.
    
    properties
        mass  {mustBeNumeric}
        d  {mustBeNumeric}
        k1  {mustBeNumeric}
        k2  {mustBeNumeric}
        k3  {mustBeNumeric}
        pw {mustBeNumeric}
        f {mustBeNumeric}
    end
    
    methods
        
        function obj = MuscleModel(mass_, d_, k1_, k2_, k3_, pw_, f_)
            if nargin == 7
                obj.mass = mass_;
                obj.d = d_;
                obj.k1 = k1_;
                obj.k2 = k2_;
                obj.k3 = k3_;
                obj.pw = pw_;
                obj.pw = f_;
            end
        end
        
        function normalized_tendon_length = norm_tendon_length(obj, muscle_tendon_length, normalized_muscle_length)
            % Input Parameters
            % (1) muscle_tendon_length: non-normalized length of the full muscle-tendon
            % complex (typically found from joint angles and musculoskeletal geometry).
            % (2) normalized_muscle_length: normalized length of the contractile element
            % (the state variable of the muscle model)
            % (3) resting_length_muscle: actual length (m) of muscle (CE) that corresponds to
            % normalized length of 1
            % (4) resting_length_tendon: actual length of tendon (m) that corresponds to
            % normalized length of 1
            
            % Output
            % normalized length of the tendon
            
            normalized_tendon_length = ...
                (muscle_tendon_length - obj.resting_length_muscle * normalized_muscle_length) / obj.resting_length_tendon;
        end
        
    end
    
end