clear; clc; close all;

t_f = 2e6;
dt = 50;
N = floor(t_f/dt);

G = 6.6743e-11;
m1 = 5.972e24;
m2 = 7.346e22;
m3 = 1e4;

K = 1.17;

A_semi = 384400e3;

cord1 = [-4.67e6, 0, 0];
cord2 = [A_semi, 0, 0];
cord3 = [A_semi * K, 0, 0];

center = [0 0 0];

v1 = [0, 0, 0];
v2 = [0, 1022, 0];
v3 = [0, 1000*K, 0];


r1 = cord1 - center;
r2 = cord2 - center;
r3 = cord3 - center;

hold on;
body1_handle = plot(NaN, NaN, 'b', 'MarkerSize', 40);
body2_handle = plot(NaN, NaN, 'g', 'MarkerSize', 25);
body3_handle = plot(NaN, NaN, 'ro', 'MarkerSize', 3);

axis equal;
xlim([-1.5*A_semi, 1.5*A_semi]);
ylim([-1.5*A_semi, 1.5*A_semi]);

cleaner = onCleanup(@() disp('Program lifecycle ended. Cleaning up resources...'));

for n = 1:N
    r12 = r1 - r2; r13 = r1 - r3; r23 = r2 - r3;

    F1 = -G*m1*m2*r12/norm(r12)^3 - G*m1*m3*r13/norm(r13)^3;
    F2 =  G*m1*m2*r12/norm(r12)^3 - G*m2*m3*r23/norm(r23)^3;
    F3 =  G*m1*m3*r13/norm(r13)^3 + G*m2*m3*r23/norm(r23)^3;

    v1 = v1 + (F1/m1)*dt; v2 = v2 + (F2/m2)*dt; v3 = v3 + (F3/m3)*dt;
    cord1 = cord1 + v1*dt; cord2 = cord2 + v2*dt; cord3 = cord3 + v3*dt;

    r1 = cord1 - center;
    r2 = cord2 - center;
    r3 = cord3 - center;

    if mod(n, 5) == 0


        set(body1_handle, 'XData', cord1(1), 'YData', cord1(2));
        set(body2_handle, 'XData', cord2(1), 'YData', cord2(2));
        set(body3_handle, 'XData', cord3(1), 'YData', cord3(2));

        drawnow;
    end

end
