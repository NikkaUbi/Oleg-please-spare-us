clear; clc; close
m = 1;
gamma = 0.5;
sigma = 2;
dt = 0.05;
T = 10;
N = floor(T/dt);
t = linspace(0,T,N);
x = zeros(1,N);
v = zeros(1,N);
x(1) = 0;
v(1) = 0;
for n = 1:N-1
   noise = randn;
   v(n+1) = v(n) - (gamma/m)*v(n)*dt + (sigma/m)*sqrt(dt)*noise;
   x(n+1) = x(n) + v(n)*dt;
end
plot(t,x)
xlabel('t')
ylabel('x(t)')
title('????????? ????????')
grid on

