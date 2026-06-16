function dxdt = diffunc(t,x)
  global a, b;
  dxdt(1) = x(2);
  dxdt(2) = -a*sin(x(1)) - b*x(2);

  dxdt = transpose(dxdt);
end

