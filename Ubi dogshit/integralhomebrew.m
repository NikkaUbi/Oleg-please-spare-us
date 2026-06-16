clc;clear;close;


N = 100;
f = @(x) (1/sqrt(2*pi))*exp(-0.5*(x.^2));
x = linspace(0,1,N);

y = f(x);

SL = 0;
SR = 0;


dx = x(2)-x(1);

for n = 1:N-1

  SL = SL + y(n)*dx;
  SR = SR + y(n+1)*dx;
end

disp(SL)
disp(SR)
