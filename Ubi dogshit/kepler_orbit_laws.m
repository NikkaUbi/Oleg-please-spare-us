clear; close all; clc;

global C;
% Initial conditions
v0_vec = [2*pi*1.4, 0];
cord0 = [0, 1];
innit = [cord0, v0_vec];

% --- Calculate the Exact Period ---
r0 = norm(cord0);                 % Initial distance from origin (1.0)
v0 = norm(v0_vec);                % Initial speed magnitude

% Specific orbital energy: E = v^2/2 - C/r
E = (v0^2 / 2) - (C / r0);

% Semi-major axis: a = -C / (2*E)
a = -C / (2 * E);

% Kepler's 3rd Law: T = 2*pi*sqrt(a^3 / C)
% Since C = 4*pi^2, this simplifies to T = sqrt(a^3)
T = 2 * pi * sqrt(a^3 / C);
% ----------------------------------

% Set tspan from 0 to exactly one period T
tspan = linspace(0, T, 2000);
options = odeset('RelTol', 1e-6, 'AbsTol', 1e-9);


[tt, XX] = ode45(@(t,x) orbitdif(t,x), tspan, innit, options);


figure;
plot(XX(:,1), XX(:,2));
hold on;
plot(0, 0, 'ro', 'MarkerFaceColor', 'r');
axis equal;
grid on;



