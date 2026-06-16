function dxdt = orbitdif(t,X)

  dxdt = zeros[1,4];

  dxdt(1) = X(3);
  dxdt(2) = X(4);
  dxdt(3) = C*X(1)/abs(X(1))^3;
  dxdt(4) = C*X(2)/abs(X(2))^3;

end
