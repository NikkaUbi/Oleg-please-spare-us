clear; clc; close all;

% Constants
t_f = 1e10;
dt = 500; % Reduced dt for better RK4 accuracy
G = 6.674e-11;
M = 5.972e24;
planet = [-0.0549 * 384400e3, 0, 0]; % Center of mass / Focus

% Initial State: [x, y, z, vx, vy, vz]
r0 = [0, 383800e3, 0];
v0 = [1038.486, 0, 0];
Y = [r0, v0];

% Derivatives function: Returns [velocity, acceleration]
% Y(1:3) is position, Y(4:6) is velocity
f = @(t, Y) [Y(4:6), -G * M * (Y(1:3)-planet) / norm(Y(1:3)-planet)^3];

% Setup Plot
figure(1); hold on; grid on; axis equal;
trail = animatedline('Color', 'b');
body1 = plot(planet(1), planet(2), 'ro', 'MarkerSize', 15, 'MarkerFaceColor', 'r'); % Earth
body2 = plot(Y(1), Y(2), 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');           % Moon

for n = 1:10000
    % --- RK4 Implementation ---
    k1 = f(0, Y);
    k2 = f(0, Y + 0.5 * dt * k1);
    k3 = f(0, Y + 0.5 * dt * k2);
    k4 = f(0, Y + dt * k3);

    Y = Y + (dt/6) * (k1 + 2*k2 + 2*k3 + k4);
    % ---------------------------

    % Update Visuals
    addpoints(trail, Y(1), Y(2));
    set(body2, 'XData', Y(1), 'YData', Y(2));

    if mod(n, 20) == 0
        drawnow limitrate;
    end
end
