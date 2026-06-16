clear; close all; clc;

global C;
C = 1;

v0 = [1, 0];
cord0 = [0, 1];

innit = [cord0, v0];

tspan = linspace(0, 2*pi, 2000);

options = odeset('RelTol', 1e-6, 'AbsTol', 1e-9);

[tt, XX] = ode45(@(t,x) orbitdif(t,x), tspan, innit, options);


figure;
plot(XX(:,1), XX(:,2), 'b-', 'LineWidth', 1.5);
hold on;
plot(0, 0, 'ro', 'MarkerFaceColor', 'r');
axis equal;
grid on;



