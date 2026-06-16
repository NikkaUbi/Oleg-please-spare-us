clear;close;clc;

k1 = 200;
k_mid = 150;

m1 = 5;
m2 = 7;

tspan = [0 40];

init_state = [-4, 10, 11, -4];


function dYdt = double_oscilator_der(t, Y, m1, m2, k1, k2)

  x1 = Y(1);
  x2 = Y(2);

  v1 = Y(3);
  v2 = Y(4);

  F1 = -k1*x1 + k2*(x2-x1);

  F2 = -k1*x2 - k2*(x2-x1);

  a1 = F1/m1;

  a2 = F2/m2;

  dYdt = [v1; v2; a1; a2];

end

[t,state] = ode45(@(t,Y) double_oscilator_der(t, Y, m1, m2, k1, k_mid), tspan, init_state);

plot(t, state(:,2));
hold on;
plot(t, state(:,1));

