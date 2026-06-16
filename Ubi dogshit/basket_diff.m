function dxdt = basket_diff (t, X)

  global alpha g;

  dxdt = zeros(4,1);

  v = sqrt(X(3)^2 + X(4)^2);

  dxdt(1) = X(3);
  dxdt(2) = X(4);
  dxdt(3) = -alpha*v*X(3);
  dxdt(4) = -g -alpha*v*X(4);

end
