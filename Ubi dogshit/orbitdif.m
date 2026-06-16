function dxdt = orbitdif(t,X)
  global C;
  dxdt = zeros(4,1);
  r = sqrt(X(1)^2 + X(2)^2);
  dxdt(1) = X(3);
  dxdt(2) = X(4);
  dxdt(3) = -C*X(1)/r^3;
  dxdt(4) = -C*X(2)/r^3;

end
