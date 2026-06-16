clc;clear;close;

q0 = 1;
R = 5;

N = 120;
cord = zeros(N,2);
phi = linspace(0,2*pi,N+1);
phi(end) = [];

F = zeros(N, 2);

for n = 1:N

  q(n) = (-1)^n * q0;
  cord(n,1) = R*cos(phi(n));
  cord(n,2) = R*sin(phi(n));

end

for n = 1:N
  for m = 1:N
    if n == m
      continue;
      end
      r = (cord(n,:) - cord(m,:))

      F(n,:) = F(n,:) + q(n) * q(m) * r/norm(r)^3;
    end
  end

