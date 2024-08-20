% main.m

% Define the number of particles
N = 100;

% Initialize particles and weights
particles = initialize_particles(N);
weights = ones(N, 1) / N;

% Initialize figure
figure;
hold on;
axis equal;

% Plot actual path
theta_real = linspace(0, 2*pi, 100);
plot(2*cos(theta_real), 2*sin(theta_real), 'r');
title('Particles by using PF');
xlabel('X');
ylabel('Y');

% Initialize array for estimated trajectory
x_estimated_traj = [];
y_estimated_traj = [];

% Run the Particle Filter for 100 steps
for t = 1:100
    [particles, weights, x_est, y_est] = Particle_Filter(particles, weights, N);

    % Save estimate coordinates
    x_estimated_traj = [x_estimated_traj; x_est];
    y_estimated_traj = [y_estimated_traj; y_est];

    % Plot the location of particles
    x_particles = particles(:, 1) .* cos(particles(:, 2));
    y_particles = particles(:, 1) .* sin(particles(:, 2));
    scatter(x_particles, y_particles, 'b.');

    drawnow; % Update figure

    fprintf('Time step %d estimated position (r, theta): (%f, %f)\n', t, sqrt(x_est^2 + y_est^2), atan2(y_est, x_est));
end

hold off;