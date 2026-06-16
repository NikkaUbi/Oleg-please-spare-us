clear;close;clc;

global g L0 p a;

g = 9.81;
L0 = 4;
p = 0.2;
a = 1;

tspan = [0 100];
innit = [pi/12,0];

[tt,XX] = ode45(@(t,x)chng_osc_diff(t,x),tspan,innit);

theta = XX(:,1);
L = L0 + a * cos(p * tt);

x = L .* sin(theta);
y = -L .* cos(theta);
figure;
hRod = plot([0, x(1)], [0, y(1)], 'k-', 'LineWidth', 2); hold on;
hBob = plot(x(1), y(1), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
grid on;
axis equal;

xlim([-(L0+a) (L0+a)]);
ylim([-(L0+a)-1 1]);

title('Pendulum Animation');


for k = 1:length(tt)

    set(hRod, 'XData', [0, x(k)], 'YData', [0, y(k)]);
    set(hBob, 'XData', x(k), 'YData', y(k));

    drawnow;
    pause(0.05);
end
