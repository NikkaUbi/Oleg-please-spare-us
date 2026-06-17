clear;close;clc;

  global g L;

  g = 9.81;
  L = 5;

  innit = [pi/6; 0];

  tspan = [0 100];

  [tt, XX] = ode45(@(t,X) h_osc_diff_pendulum(t,X), tspan,innit);

  comet(tt,XX(:,1));
