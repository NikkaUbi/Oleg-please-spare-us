% 1. Setup Ellipse Parameters
center = [0, 0, 0]';
a = 5; % Semi-major axis
b = 2; % Semi-minor axis

% Directional vectors (normalized)
V1 = [1, 1, 1]; V2 = [-1, 1, 0];
u1 = (V1 / norm(V1))'; u2 = (V2 / norm(V2))';

% 2. Keplerian Time-Stepping (Constant Delta t)
ecc = sqrt(1 - (b/a)^2);
t = linspace(0, 2*pi, 201);   % 201 points gives a clean division
E = zeros(size(t));

% Solve for E (Eccentric Anomaly) using Newton-Raphson
for i = 1:length(t)
    E_old = t(i);
    for k = 1:10
        E_old = E_old - (E_old - ecc*sin(E_old) - t(i)) / (1 - ecc*cos(E_old));
    end
    E(i) = E_old;
end

% True anomaly (theta) derived from E
theta = 2 * atan(sqrt((1+ecc)/(1-ecc)) * tan(E/2));

% 3. Generate 3D Ellipse Path
x_local = a * cos(theta);
y_local = b * sin(theta);
ellipse_3D = center + u1*x_local + u2*y_local;

% 4. Plotting & Area Calculation Loop
figure;
plot3(ellipse_3D(1,:), ellipse_3D(2,:), ellipse_3D(3,:), 'k-', 'LineWidth', 1.5);
hold on; grid on;

step = 20; % Constant Delta t step size
colors = lines(length(1:step:(length(t)-1)));
color_idx = 1;

fprintf('\n--- Calculating Wedge Areas for Constant Delta t ---\n');

for i = 1:step:(length(t)-step)
    idx = i:(i+step);

    % 3D Coordinates for the current visual wedge
    x_wedge = [center(1), ellipse_3D(1, idx), center(1)];
    y_wedge = [center(2), ellipse_3D(2, idx), center(2)];
    z_wedge = [center(3), ellipse_3D(3, idx), center(3)];

    % --- DYNAMIC AREA CALCULATION ---
    % Sum up the areas of the tiny triangles inside this wedge using cross products
    wedge_area = 0;
    for j = 1:(length(idx)-1)
        % Vector from center to point j
        vecA = ellipse_3D(:, idx(j)) - center;
        % Vector from center to point j+1
        vecB = ellipse_3D(:, idx(j+1)) - center;

        % Area of triangle = 0.5 * magnitude of cross product
        tri_area = 0.5 * norm(cross(vecA, vecB));
        wedge_area = wedge_area + tri_area;
    end

    % Print the calculated area to the Command Window
    fprintf('Wedge %2d (Time index %3d to %3d) -> Approx Area: %.5f\n', ...
            color_idx, i, i+step, wedge_area);

    % Fill the sector visually
    fill3(x_wedge, y_wedge, z_wedge, colors(color_idx,:), 'FaceAlpha', 0.4, 'EdgeColor', 'none');
    color_idx = color_idx + 1;
end

% Formatting the plot
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Equal Areas Swept in Equal Delta Time (\Delta t)');
axis equal; view(3);
