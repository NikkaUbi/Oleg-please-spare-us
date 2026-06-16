clc;clear;close;

T_amb = 20;
T_ball_0 = 200;
k = 0.05;

dt = 0.01;
t = 0:dt:100;
N = length(t);

T = zeros(1,N);

T(1) = T_ball_0;

for n = 1:N-1

  dT = -k*(T(n) - T_amb);

  T(n+1) = T(n) + dT*dt;

end

plot(t,T);

