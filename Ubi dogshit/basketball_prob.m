clear;clc;close

global alpha g;

alpha = 0.05;
g = 9.81;
theta_deg = 35;

theta = deg2rad(theta_deg);

v0 = 100;

v0_vec = [v0*cos(theta),v0*sin(theta)];

cord0 = [0,0];

tspan = [0 100];
innit = [cord0,v0_vec];

[tt,XX] = ode45(@(t,x) basket_diff(t,x),tspan,innit);

plot(XX(:,1),XX(:,2));
for n = 2:length(tt)-1
    if XX(n,2) > XX(n+1,2) && XX(n,2) > XX(n-1,2)
      ytop = XX(n,2) + 1;
    end
    if XX(n,2) <= 0 && XX(n-1,2) >=0
      xtop = XX(n,1) + 1;
    end
end
xlim([0 xtop]);
ylim([0, ytop]);


