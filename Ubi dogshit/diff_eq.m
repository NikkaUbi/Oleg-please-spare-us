function dxdt = diff_eq(t,X)

  dxdt(1) = X(1) - 0.5*X(1)*X(2);
  dxdt(2) = -X(2) + 0.2*X(1)*X(2);


end
