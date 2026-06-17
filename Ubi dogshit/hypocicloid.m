clear;clc;close

t0=0; tm=100; dt=0.001;
a=8; b=1; d=1.2; w=1;
t=t0:dt:tm;
phi=w*t;
x=(a-b)*cos(b*phi/(a-b))+d*cos(phi);
y=(a-b)*sin(b*phi/(a-b))-d*sin(phi);
plot(x,y)
axis([-a a -a a])
axis equal
