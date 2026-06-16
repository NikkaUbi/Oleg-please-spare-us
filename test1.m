clc; clear;


r = 4;

h = 0.05;

x = -7:h:7;
y = -7:h:7;

[X,Y] =meshgrid(x, y)

A = r^2 - X.^2 - Y.^2;
Z = -sqrt((abs(A) + A)/2);

surf(X,Y,Z);


xlim([-5,5]);
zlim ([-5,5]);
ylim([-5,5]);

axis equal;
