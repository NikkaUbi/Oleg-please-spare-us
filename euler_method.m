clc;clear;close

r = 0.5;
y0 = 10;

dt = 0.1;
t = 0:dt:10;
N = length(t);

f = @(t, y) -r*y;

y(1) = y0;

for n = 1:N-1

  y(n+1) = y(n) + dt* f(t(n),y(n));

end

y_a = y0*exp(-r*t);

plot(t, y_a);
hold on;
plot(t, y);




