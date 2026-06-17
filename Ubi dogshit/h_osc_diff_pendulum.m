function dxdt = h_osc_diff_pendulum(t,X)

  global g L;
  dxdt = zeros(2,1);

  dxdt(1) = X(2);
  dxdt(2) = -g*sin(X(1))/L;

end

