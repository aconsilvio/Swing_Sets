function res = swingthetasweep(omega)
    g = 10;
    l = 5;
    m = 1;
    beta = 1/10;
    %omega = sqrt(g/l);
    %a = 2;
    a = 1;
 
    theta_init = -pi/4;

 
    thetadot_init = 0;

    options = odeset('reltol', 1e-8);
    
    [t, M] = ode45(@rate_func, [0:.002:50], [theta_init, thetadot_init], options);
    
    thetas = M(:, 1);
    thetadots = M(:, 2);

    for x=1:length(thetas)
        X1(x) = radius(t(x)) * cos(thetas(x));
        Y1(x) = radius(t(x)) * sin(thetas(x));
        KE(x) = 1/2 * m * radius(t(x))^2*thetadots(x)^2 ;%(r_dot(t(x))^2+radius(t(x))^2 * thetadots(x)^2);
        PE(x) = m * g * radius(t(x)) * sin(thetas(x));
    end

    res = Y1;
%     subplot(1,3,1)
%     plot(thetas, KE)
%     subplot(1,3,2)
%     plot(thetas,PE)
%     subplot(1,3,3)
%     plot(t, PE+KE)
 
%     plot(t, Y1);

%     subplot(1, 2, 1)
%     plot(t, radius(t))
%     subplot(1, 2, 2)
%     plot(t, thetas)

    for i=1:length(X1)
       draw_func(X1(i), Y1(i));
    end

 
    function W = rate_func(t, I)
        theta = I(1);
        thetadot = I(2);

 
        doubledot = double_dot(theta, thetadot, t);

 
        W = [thetadot; doubledot];
    end

 
    function res = double_dot(theta, thetadot, t)
        res = (-g * cos(theta) - 2 * thetadot * r_dot(t))/radius(t);
    end

    function res = radius(t)
       res = beta * l * cos(a * omega * t + theta_init) + l; 
    end

    function res = r_dot(t)
       res = -beta * l * a * omega * sin(a * omega * t + theta_init); 
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

