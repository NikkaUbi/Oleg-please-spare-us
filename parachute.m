clc; clear; close all;

% Constants

tolerance = 1e-12;
mu_1 = 2;
mu_2 = 40;
m = 80;
g = 9.81;
dt = 0.01;
t = 0:dt:100;
N = length(t);

% Pre-allocate arrays for speed
v = zeros(1, N);
h = zeros(1, N);
a = zeros(1, N);

% Initial Conditions
v(1) = 0;
h(1) = 2000;
a(1) = -g - (mu_1/m)*v(1)^2*sign(v(1));

% Parachute Tracking Variables
chute_opened = false;
t_chute = NaN; % Default to NaN (Not a Number) until it deploys

% Simulation Loop
for n = 2:N

    % Check if terminal velocity is reached to deploy the chute
    % We use a(n-1) because a(n) hasn't been calculated for this step yet
    if ~chute_opened && a(n-1) >= -tolerance
        chute_opened = true;
        t_chute = t(n-1);
        fprintf('Parachute deployed at t = %.2f seconds!\n', t_chute);
    end

    % Assign drag coefficient based on parachute state
    if ~chute_opened
        k = mu_1;
    else
        k = mu_2;
    end

    % Physics Equations
    a(n) = -g - (k/m)*v(n-1)^2*sign(v(n-1));
    v(n) = v(n-1) + a(n)*dt;
    h(n) = h(n-1) + v(n)*dt;

    % Ground collision check (Stop simulation if they hit the deck)
    if h(n) <= 0
        h(n) = 0;
        % Optional: truncate arrays here if you want clean plots
        break;
    end
end

% Plot results
figure;
subplot(3,1,1); plot(t, h, 'LineWidth', 1.5); ylabel('Height (m)'); title('Skydive Simulation'); grid on;
subplot(3,1,2); plot(t, v, 'LineWidth', 1.5); ylabel('Velocity (m/s)'); grid on;
subplot(3,1,3); plot(t, a, 'LineWidth', 1.5); ylabel('Acceleration (m/s^2)'); xlabel('Time (s)'); grid on;

% Add a visual marker for t_chute on the plots if it deployed
if ~isnan(t_chute)
    for i = 1:3
        subplot(3,1,i); hold on;
        xline(t_chute, '--r', 'Chute Deployed', 'LabelVerticalAlignment', 'bottom');
    end
end
