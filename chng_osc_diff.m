function dxdt = chng_osc_diff (t,X)

  global g L0 a p;

  L = L0 + a*cos(p*t);

  dxdt = zeros(2,1);

  dxdt(1) = X(2);
  dxdt(2) = -g*sin(X(1))/L;

endfunction
