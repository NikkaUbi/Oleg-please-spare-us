clear;close;clc;

    G = 1;
    tspan = [0 150];


    m1 = 1.5;
    m2 = 0.8;
    m_neut = 3.0;

    R1 = 1.0;
    R2 = 0.8;
    R_neut = 0.03;

    r1 = [0, 0];
    r2 = [2, 0];

    r3 = [15, 3];


    v1 = [0, -0.4];
    v2 = [0, 0.5];

    v_neut = [-0.8, -0.05];


    initial_state = [r1, r2, r3, v1, v2, v_neut];

    options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
    [t, state] = ode45(@(t, y) gravity_derivatives(t, y, G, m1, m2, m_neut), tspan, initial_state, options);



    figure('Name', 'Three-Body Exchange Simulation', 'Position', [100, 100, 800, 600]);
    hold on;
    grid on;
    axis equal;
    xlim([-50 50]);
    ylim([-40 40]);
    xlabel('X Position');
    ylabel('Y Position');
    title('Stellar Interloper: Three-Body Exchange');


    p1 = plot(state(:,1), state(:,2), 'b--', 'LineWidth', 0.5);
    p2 = plot(state(:,3), state(:,4), 'g--', 'LineWidth', 0.5);
    p3 = plot(state(:,5), state(:,6), 'r--', 'LineWidth', 0.5);


    h1 = plot(state(1,1), state(1,2), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 8, 'DisplayName', 'Star 1 (Normal)');
    h2 = plot(state(1,3), state(1,4), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 6, 'DisplayName', 'Star 2 (Normal)');
    h3 = plot(state(1,5), state(1,6), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 2, 'DisplayName', 'Star 3 (Neutron Star)');
    legend([h1, h2, h3], 'Location', 'northwest');

    for k = 1:5:length(t)


      set(h1, 'XData', state(k,1), 'YData', state(k,2));
      set(h2, 'XData', state(k,3), 'YData', state(k,4));
      set(h3, 'XData', state(k,5), 'YData', state(k,6));


    end

