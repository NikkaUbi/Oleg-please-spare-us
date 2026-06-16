clc;close;clear;

N = 10000;

L1 = 60;
L2 = 60;
W = 40;

x = linspace(0,W,N);
t = zeros(1,N);
phi1 = zeros(1,N);
phi2 = zeros(1,N);
v1 = 10;
v2 = 6;

for n = 1:N

  t1 = sqrt(x(n)^2 + L1^2)/v1;
  t2 = sqrt((W - x(n))^2 + L2^2)/v2;
  phi1(n) = atan(x(n)/L1);
  phi2(n) = atan((W-x(n))/L2);
  t(n) = t1 + t2;
end

tmin = min(t);

[M,I] = min(t);

phimin = [rad2deg(phi1(I)), rad2deg(phi2(I))];

