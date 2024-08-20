function [particles, weights, x_est, y_est] = Particle_Filter(particles, weights, N)
    % Particle_Filter.m
    % This function performs one step of the particle filter

    % Predict step
    for i = 1:N
        particles(i, :) = state_transition(particles(i, :))';
    end

    % Measurement update
    % In real scenario, we will get this from the robot's sensors
    % For simulation, we will generate a measurement using the true state
    true_state = [2, pi/2]; 
    z = measurement_function(true_state, 0.2); 
    
    % Update weights based on measurement
    for i = 1:N
        % Here we assume the measurement noise is Gaussian with variance 0.2
        expected_measurement = measurement_function(particles(i, :), 0.2);
        weights(i) = normpdf(z, expected_measurement, sqrt(0.2));
    end
    
    % Normalize the weights
    weights = weights / sum(weights);
    
    % Resample particles based on weights
    indices = randsample(1:N, N, true, weights);
    particles = particles(indices, :);
    
    % Estimate state
    estimate = sum(particles .* repmat(weights, 1, 2), 1);

    % Convert polar coordinates to Cartesian coordinates
    x_est = estimate(1) * cos(estimate(2));
    y_est = estimate(1) * sin(estimate(2));
end