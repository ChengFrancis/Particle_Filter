# Particle_Filter
ECE 9156 Project

This project implements a basic particle filter simulation in MATLAB. The simulation demonstrates the use of particles to estimate the position of an object moving in a circular path. The filter uses a state transition model to predict the next state and a measurement update step to refine the estimates based on simulated sensor data.

## Project Structure

- **main.m**: The main script that initializes the particle filter, runs the simulation, and visualizes the results.
- **Particle_Filter.m**: A function that performs one iteration of the particle filter, including prediction, measurement update, resampling, and state estimation.
- **initialize_particles.m**: A function to initialize the particles used in the particle filter.
- **state_transition.m**: The state transition function that predicts the next state of each particle.
- **measurement_function.m**: The measurement function that simulates sensor readings based on the current state.

## Running the Simulation

1. Clone or download the project repository.
2. Ensure all files are in the same directory.
3. Open MATLAB and navigate to the project directory.
4. Run the `main.m` script to start the simulation.

The simulation will plot the true path of the object and the estimated positions of the particles at each time step.

## Functions Overview

### main.m

- Initializes the number of particles (`N`).
- Initializes the particles using `initialize_particles`.
- Runs the particle filter for 100 steps, calling `Particle_Filter` at each iteration.
- Plots the true path and the particles' estimated positions.

### Particle_Filter.m

- **Inputs**: `particles`, `weights`, `N`
- **Outputs**: Updated `particles`, `weights`, and the estimated Cartesian coordinates (`x_est`, `y_est`).
- Steps:
  - Predict the next state of each particle using the `state_transition` function.
  - Simulate a sensor measurement and update the weights of each particle based on the `measurement_function`.
  - Resample the particles based on the updated weights.
  - Estimate the state based on the resampled particles.

### initialize_particles.m

- Initializes particles in polar coordinates with the radius (`r`) sampled from a normal distribution and the angle (`theta`) sampled uniformly.

### state_transition.m

- **Inputs**: Current state vector `X_current`.
- **Output**: Next state vector `X_next`.
- Simulates the state transition using a simple model where the angle changes with some noise while the radius remains constant.

### measurement_function.m

- **Inputs**: Current state vector `X_current`, sensor variance `sensor_variance`.
- **Output**: Simulated sensor measurement `z`.
- Models a noisy sensor measurement of the radius.

## Notes

- The state transition model assumes that the object moves with a constant angular velocity with some Gaussian noise.
- The measurement function assumes the sensor measures the distance (`r`) with Gaussian noise.

## License

This project is open-source and available under the MIT License.
