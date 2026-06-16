close;clc;clear;

z_func = @(x,y) (x.^2 + y.^2).^2;

[x,y] = meshgrid([-10:0.1:10], [-10:0.1:10]);

Z = z_func(x,y);

surf(x,y,Z);
xlabel('X');
ylabel('Y');
zlabel('Z');



