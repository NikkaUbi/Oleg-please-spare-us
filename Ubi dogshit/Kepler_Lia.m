clear;clc;close

del=0.000001; x0=0; y0=1.00;
% global G M
%R=6400000; G=6.67e-11; M=6e+24;
%T=sqrt(4*pi^2*R^3/G/M);
vx0=2*pi*1.4; vy0=0;
t0=0; tm=300; dt=10^-4;

function dxdt=kepler_eq(t,x)
    %global G M
    %x=[x; vx; y; vy]
   dxdt=[x(2); -4*pi^2*x(1)./(x(1).^2+x(3).^2).^(3/2);
         x(4); -4*pi^2*x(3)./(x(1).^2+x(3).^2).^(3/2)];
    end

options=odeset('reltol', del, 'AbsTo',[del del del del]);
[t, X]=ode45('kepler_eq', [t0:dt:tm], [x0 vx0 y0 vy0], options);
N=100;
for i=1:N
    fi=2*pi/N*i;
    xx(i)=cos(fi);
    yy(i)=sin(fi);
    end
figure;
plot (xx, yy, '*', 0, 0, 'o', X(:,1), X(:,3))
axis equal
%plot(X(:,1), X(:,3))


