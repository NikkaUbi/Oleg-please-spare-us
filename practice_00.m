clc;clear;close;

omega = 1.5; beta = 0;

x0 = 0;
v0 = 3;

dt = 0.001;
tf = 25;

t = 0:dt:tf;

N = length(t);

x = zeros(1,N);
v = zeros(1,N);

x(1) = x0;
v(1) = v0;

for n = 1:N-1

  v(n+1) =v(n) + (-beta*v(n) - omega^2 * x(n))*dt;
  x(n+1) = x(n) + v(n)*dt;
end;

plot(t,x, '-');
