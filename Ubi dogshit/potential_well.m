clear; close all; clc;

% Define global variables for the ODE function
global m g;
m = 4;
g = 9.81;

% 1. Simulation Parameters
tspan = [0 15]; % Simulate for 15 seconds
% Initial conditions: [x0, dx0, y0, dy0]
% Start at x=1.2, y=0 with an initial sideways velocity dy=3.5
ics = [1.2, 0, 0, 3.5];
function dsdt = ball_ode(t, s)
    global m g;

    % Unpack states for readability
    x  = s(1);
    dx = s(2);
    y  = s(3);
    dy = s(4);

    Fx = -m * g * x * ((x^2 + y^2) + 1);
    Fy = -m * g * y * ((x^2 + y^2) + 1);


    dsdt = [dx;
            Fx/m;
            dy;
            Fy/m];
end

[t, states] = ode45(@ball_ode, tspan, ics);

x_ball = states(:, 1);
y_ball = states(:, 3);
z_ball = 0.25*(x_ball.^2 + y_ball.^2).^2 + 0.5*(x_ball.^2 + y_ball.^2);

figure('Position', [100, 100, 800, 600]);

[X, Y] = meshgrid(-1.5:0.05:1.5, -1.5:0.05:1.5);
Z = 0.25*(X.^2 + Y.^2).^2 + 0.5*(X.^2 + Y.^2);


mesh(X, Y, Z, 'FaceAlpha', 0.25, 'EdgeColor', [0.6 0.6 0.6]);
hold on;

plot3(x_ball, y_ball, z_ball, 'r-', 'LineWidth', 2);

z_start = 0.25*(ics(1)^2+ics(3)^2)^2 + 0.5*(ics(1)^2+ics(3)^2);
plot3(ics(1), ics(3), z_start, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');

xlabel('X Position (m)');
ylabel('Y Position (m)');
zlabel('Height Z (m)');
title('Ball Trajectory in a Potential Well (No Toolboxes Required)');
grid on;
view(-35, 40);
legend('Potential Well Surface', 'Ball Trajectory', 'Start Point');


