classdef MuscleModel
    % Muscle mode
    % dynamic model is defined in terms of normalized length and velocity.
    % To model a particular muscle, scale factors are needed for force, CE
    % length, and SE length.
    
    properties
        mass  {mustBeNumeric}
        distance  {mustBeNumeric} % distance between ankle and centroid of the foot
        k1  {mustBeNumeric}
        k2  {mustBeNumeric}
        k3  {mustBeNumeric}
        pw  {mustBeNumeric}
        f  {mustBeNumeric}
        resting_length_muscle  {mustBeNumeric} % 0.6*resting_length_tibialis
        resting_length_tendon  {mustBeNumeric} % 0.4*resting_length_tibialis
    end
    
    methods
        
        function obj = MuscleModel(mass_, distance_, k1_, k2_, k3_, pw_, f_, resting_length_muscle_, resting_length_tendon_)
            if nargin == 9
                obj.mass = mass_;
                obj.distance = distance_;
                obj.k1 = k1_;
                obj.k2 = k2_;
                obj.k3 = k3_;
                obj.pw = pw_;
                obj.f = f_;
                obj.resting_length_muscle = resting_length_muscle_;
                obj.resting_length_tendon = resting_length_tendon_;
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