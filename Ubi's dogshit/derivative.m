clc;clear;close;


dt = 0.01;

t = 0:dt:5;

x = cos(t.^3);


N = length(t);

vR = zeros(1,N);
vL = zeros(1,N);
vC = zeros(1,N);

vA = (-3*t.^2).*sin(t.^3);

vR(1) = (x(2) - x(1))/dt;

for n  = 2:N-1

  vR(n) = (x(n+1)-x(n))/dt;
  vL(n) = (x(n)-x(n-1))/dt;
  vC(n) = (x(n+1)-x(n-1))/(2*dt);

end;

vR(end) = nan;

plot(t, vA, 'black');
hold on;
plot(t, vR, '-o');
plot(t, vL, '-o');
plot(t, vC, '-o');

