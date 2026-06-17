function lorenz_simulation()
    % Parameters (Classic values that cause chaotic behavior)
    sigma = 10;
    beta = 8/3;
    rho = 28;

    % Time span for the simulation [start, end]
    tspan = [0 50];

    % Initial conditions [x0, y0, z0]
    % (Slightly changing these will yield completely different trajectories!)
    initial_state = [1; 1; 1];

    % Solve the system using ode45
    [t, state] = ode45(@(t, state) lorenz_system(t, state, sigma, beta, rho), tspan, initial_state);

    % Extract the trajectories
    x = state(:, 1);
    y = state(:, 2);
    z = state(:, 3);

    % --- Plotting the Lorenz Attractor ---
    figure;
    plot3(x, y, z, 'b', 'LineWidth', 1);
    grid on;
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title('The Lorenz Attractor');
    axis tight;
    view(45, 15); % Adjust the 3D camera angle for a better view
end

% --- Define the Lorenz System Equations ---
function dstate = lorenz_system(~, state, sigma, beta, rho)
    % state(1) = x, state(2) = y, state(3) = z
    x = state(1);
    y = state(2);
    z = state(3);

    % The differential equations
    dx = sigma * (y - x);
    dy = x * (rho - z) - y;
    dz = x * y - beta * z;

    % Return as a column vector
    dstate = [dx; dy; dz];
end
