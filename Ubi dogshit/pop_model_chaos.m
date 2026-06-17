% MATLAB Script: Logistic Map Bifurcation Diagram
clear; clc; clf;

% Parameters
r_min = 2.5;
r_max = 4.0;
num_r = 1000;          % Resolution of the r axis
num_steps = 500;       % Total iterations per r
num_discard = 400;     % Let transients die out; plot the last 100 points

% Preallocate arrays for plotting
r_space = linspace(r_min, r_max, num_r);
R_plot = zeros(num_steps - num_discard, num_r);
X_plot = zeros(num_steps - num_discard, num_r);

for j = 1:num_r
    r = r_space(j);
    x = 0.5; % Initial population seed

    % Iterate the discrete system
    for n = 1:num_steps
        x = r * x * (1 - x);

        % Only save points after transients have settled
        if n > num_discard
            R_plot(n - num_discard, j) = r;
            X_plot(n - num_discard, j) = x;
        end
    end
end

% Plotting with small markers for high detail
plot(R_plot(:), X_plot(:), 'k.', 'MarkerSize', 10);
title('Population growth');
xlabel('Growth Rate (r)');
ylabel('Long-term Population State (x)');
grid on;
