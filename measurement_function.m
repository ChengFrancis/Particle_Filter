function z = measurement_function(X_current, sensor_variance)
    % R is censor convariance
    r = X_current(1);
    theta = X_current(2);

    % Measure the distance
    z = r + normrnd(0, sqrt(sensor_variance)); 
end
