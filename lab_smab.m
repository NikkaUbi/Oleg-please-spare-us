clc;clear;close;

dt = 0.01;
t = 0:dt:15;

N = length(t);
y(1) = 0.2;
f = @(t,y) -(y^3)*exp(-0.02*t) + 0.5*y;

for n = 2:N

  y(n) = y(n-1) + f(t(n-1),y(n-1))*dt;

end

plot(t, y);

