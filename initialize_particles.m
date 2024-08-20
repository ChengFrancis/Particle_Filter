function particles = initialize_particles(N)
    % This function initializes the particles for the Particle Filter
    % Each particle is represented by a 2D vector [r, theta]
    % r is sampled from a normal distribution with mean 2 and variance 0.1
    % theta is sampled uniformly from the range [0, 2*pi]
    
    particles = [normrnd(2, sqrt(0.1), N, 1), 2*pi*rand(N, 1)];
end