clear;close;clc;

    % --- Parameter Setup ---
    beta  = 1.0;     % Linear stiffness
    alpha = 0.5;     % Non-linear cubic stiffness (positive = hardening spring)

    % --- Simulation Time ---
    tspan = [0, 50];  % Total time to observe several periods

    % --- Initial Conditions ---
    % Try changing x0(1) to see how the frequency changes with amplitude!
    x0 = [2.0; 1.0];  % [initial position, initial velocity]

    % --- Solve the ODE System ---
    [t, state] = ode45(@(t, x) undamped_system(t, x, beta, alpha), tspan, x0);

    % Extract results
    position = state(:, 1);
    velocity = state(:, 2);

    % --- Plotting Results ---
    figure('Position', [100, 100, 1000, 400]);

    % Subplot 1: Time History (Position vs. Time)
    subplot(1, 2, 1);
    plot(t, position, 'b-', 'LineWidth', 1.5);
    title('Time History (Undamped Non-linear)');
    xlabel('Time (s)');
    ylabel('Position (x)');
    grid on;

    % Subplot 2: Phase Portrait (Velocity vs. Position)
    % In an undamped system, this forms a closed, perfectly repeating loop.
    subplot(1, 2, 2);
    plot(position, velocity, 'r-', 'LineWidth', 1.5);
    title('Phase Portrait (Closed Orbit)');
    xlabel('Position (x)');
    ylabel('Velocity (v)');
    axis equal; % Keeps the geometric proportions accurate
    grid on;

% --- Define the System of First-Order ODEs ---
function dxdt = undamped_system(t, x, beta, alpha)
    dxdt = zeros(2, 1);

    dxdt(1) = x(2);                             % dx/dt = velocity
    dxdt(2) = -beta*x(1) - alpha*x(1)^3;        % dv/dt = acceleration (no damping, no forcing)
end
