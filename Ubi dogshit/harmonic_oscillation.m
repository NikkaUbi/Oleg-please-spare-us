function spring_oscillation()
    % Parameters
    m = 1.0;    % Mass (kg)
    k = 10.0;   % Spring constant (N/m)

    % Initial conditions: [initial displacement, initial velocity]
    x0 = [0.5; 0.0];

    % Time span
    tspan = [0 10];

    % Solve the ODE
    [t, y] = ode45(@(t, y) spring_system(t, y, m, k), tspan, x0);

    % Plot Results
    figure;
    subplot(2,1,1);
    plot(t, y(:,1), 'r-', 'LineWidth', 2);
    grid on;
    title('Mass-Spring Oscillation using ode45');
    ylabel('Displacement (m)');

    subplot(2,1,2);
    plot(t, y(:,2), 'k-', 'LineWidth', 2);
    grid on;
    xlabel('Time (s)');
    ylabel('Velocity (m/s)');
end

% ODE Function Definition
function dydt = spring_system(~, y, m, k)
    % y(1) is displacement, y(2) is velocity
    dydt = zeros(2,1);
    dydt(1) = y(2);          % dx/dt = v
    dydt(2) = -(k/m) * y(1); % dv/dt = -(k/m)*x
end


