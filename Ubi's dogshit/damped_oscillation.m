clc;clear;close;

v0 = 0;
x0 = -4;

m = 2;
k = 100;
b = 5;

A = k/m;
B = b/m;

f = @(t) A*exp(-t) + B*exp(-t);
tspan = [0 20]
init = [v0, x0]

function dxdt = damp_osc_diff(t, X,m,k,b)

    dxdt = zeros(2,1);
    A = k/m;
    B = b/m;
    dxdt(1) = -A*X(2) - B*X(1);
    dxdt(2) = X(1);

end


[t, XX] = ode45(@(t,X) damp_osc_diff(t, X, m, k, b), tspan, init);

plot(t, XX(:,2), '-');

plot(t, f(t), '-');
