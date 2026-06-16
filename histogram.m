clear;close;clc;

a = 0;
b = 0.3;
n = 7;

x = linspace(a, b, n);

y = x.^2 .* tan(sqrt(asin(x)));
hist(y);
