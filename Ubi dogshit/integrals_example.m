clc;clear;close;

a = 1;
b = 10;
dx = 0.01;

x = a:dx:b;

N = length(x);

f = @(x) exp(-x.^2);

S1 = 0;
S2 = 0;
S3 = 0;

y = f(x);
for n = 1:N-1

  S1 = S1 + (f(x(n)) + f(x(n+1)))*dx/2;

end

S1_sum = sum(y(1:end-1))*dx;
for n = 1:N-1

  S2 = S2 + (f(x(n)))*dx;

end
S2_sum = sum(y(2:end))*dx;
for n = 2:N

  S3 = S3 + (f(x(n)))*dx;

end

