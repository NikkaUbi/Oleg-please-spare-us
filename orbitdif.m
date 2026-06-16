clear;close;clc;

C = 1;
a = @(r,t) C*r/norm(r)^3;

function dxdt = orbitdif(t,X)


