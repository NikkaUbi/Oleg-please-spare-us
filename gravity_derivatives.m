function dydt = gravity_derivatives(t, y, G, m1, m2, m3)
    r1 = y(1:2);
    r2 = y(3:4);
    r3 = y(5:6);

    v1 = y(7:8);
    v2 = y(9:10);
    v3 = y(11:12);

    r12 = r2 - r1;
    r13 = r3 - r1;
    r23 = r3 - r2;

    soft = 1e-4;
    d12_3 = (norm(r12)^2 + soft)^(1.5);
    d13_3 = (norm(r13)^2 + soft)^(1.5);
    d23_3 = (norm(r23)^2 + soft)^(1.5);


    a1 = G * m2 * r12 / d12_3 + G * m3 * r13 / d13_3;
    a2 = -G * m1 * r12 / d12_3 + G * m3 * r23 / d23_3;
    a3 = -G * m1 * r13 / d13_3 - G * m2 * r23 / d23_3;

    dydt = [v1; v2; v3; a1; a2; a3];
end
