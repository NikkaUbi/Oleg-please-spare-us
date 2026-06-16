close;clear;clc;

x = linspace(-3,3,150)

a = 5;
b = 3;

y = (a*(sin(b*x)).^2)./(x.^4+1);

plot(x,y)



