clc;close;clear;

x = linspace(-3,3,150)

S = 0; f = sinh(x);

for n = 0:100;

  S = S + (x.^(2*n+1))/factorial(2*n+1);
  hold off;
  plot(x,f,'color','black');
  hold on;
  plot(x, S,'color','red');
  ylim([-3,3]);
  xlim([-3,3]);
  pause(0.1);

  end

