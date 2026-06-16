sclose; clc; clear;

N = 10000;
y =@(x) sqrt(1 - (x^2));
hold on;

lims = [0 1];
S1 = 0;
S2 = 0;

x1 = rand(1, N);
y1 = rand(1, N);

fplot(y,lims);
set(legend,'visible','off');
for n = 1:N

  plot(x1(n), y1(n));
  hold on;
  pause(0.01)

  if(y1(n)<y(x1(n)))
    S1 = S1 + 1;
  else
    S2 = S2 + 1;
  end
  piapprox = 4*(S1/(S1+S2));
  disp(piapprox);
  end
