clc;clear;close;


N=150;
S = 0;
x = linspace(-2,2,N);

for n = 0:5
  S = S + (x.^n)/factorial(n);
  hold off;
  plot(x,exp(x));
  hold on;

  plot(x,S);
  pause(0.1);
end

