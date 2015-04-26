function energyFunc()
    m = 5;
    r_init = 5;
    theta_init=pi/4;
    thetadot_init = .01;
    rdot_init = .01;
    
    options = odeset('reltol', 1e-8);
    
    [t, M] = ode45(@rate_func, [0:.2:200], [theta_init, thetadot_init, r_init, rdot_init], options);
    
    thetas = M(:, 1);
    thetadots = M(:, 2);
    rs = M(:, 3);
    rdots = M(:, 4);

    for x=1:length(thetas)
        X1(x) = rs(x) * sin(thetas(x));
        Y1(x) = rs(x) * cos(thetas(x));
    end
    
    for i=1:length(X1)
       draw_func(X1(i), Y1(i));
    end

    function W = rate_func(t, I)
        theta = I(1);
        thetadot = I(2);
        r = I(3);
        rdot = I(4);
 
        thetadoubledot = theta_double_dot(theta, thetadot, r, rdot);
        rdoubledot = r_double_dot(theta, thetadot, r, rdot);
 
        W = [thetadot; thetadoubledot; rdot; rdoubledot];
    end

    function res = theta_double_dot(theta, thetadot, r, rdot)
       res = (-r * thetadot * sin(theta) - 2 * rdot * thetadot * m)/(m * r);
    end

    function res = r_double_dot(theta, thetadot, r, rdot)
       res = (rdot * cos(theta) + r * thetadot^2 * m)/(m); 
    end

    function draw_func(x1, y1)
       clf;
       hold on;

 
       % plot position of first pendulum
       plot(x1, y1, 'bo', 'MarkerSize', 20);
       plot([x1 0], [y1 0], 'b-');

 
       xlim([-6 6])
       ylim([-6 6])

 
       drawnow;
    end
end