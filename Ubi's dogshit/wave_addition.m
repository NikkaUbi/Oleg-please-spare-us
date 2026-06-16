clear;close;clc;

A1 = 4;
A2 = 7;

x = linspace(0, 20, 2000);
t = linspace(0, 10, 2000);

k1 = 2;
k2 = 5;

f1 = 10;
f2 = 13;

omega1 = 2*pi*f1;
omega2 = 2*pi*f2;

for n = 1:2000
wave1 = A1*sin(k1*x - omega1*t(n));
wave2 = A2*sin(k2*x + omega2*t(n));

plot(x,wave1+wave2);
pause(0.01);
hold off;

end;
