function X_next = state_transition(X_current)
    dt = 0.5;
    omega_mean = 1; 
    Q = 0.1; 

    r = X_current(1);
    theta = X_current(2);

    omega = normrnd(omega_mean, sqrt(Q)); 
    theta_next = wrapTo2Pi(theta + omega * dt);

    if all(size(r) == [1 1]) && all(size(theta_next) == [1 1])
        X_next = [r; theta_next]; 
    end
end
