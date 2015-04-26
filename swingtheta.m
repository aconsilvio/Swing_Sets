function swingtheta()
    g = 10;
    l = 1.7;
    m = 1;
    beta = 0.04;
%     omega = sqrt(g/l);
    omega = 2.3649;
    a = 2;
 
    %theta_init = 4.1228;
    theta_init = -pi/4;
 
    thetadot_init = 0;

    options = odeset('reltol', 1e-8);
    
    [t, M] = ode45(@rate_func, [0:.002:80], [theta_init, thetadot_init], options);
    
    thetas = M(:, 1);
    thetadots = M(:, 2);
    
    index = 1;
    
    for x=1:length(thetas)
        X1(x) = radius(t(x)) * cos(thetas(x));
        Y1(x) = radius(t(x)) * sin(thetas(x));
        KE(x) = 1/2 * m * radius(t(x))^2*thetadots(x)^2 ;%(r_dot(t(x))^2+radius(t(x))^2 * thetadots(x)^2);
        PE(x) = m * g * radius(t(x)) * sin(thetas(x));
%         if(abs(thetadots(x)) < 1e-6)
%            times(index) = t(x)
%            index = index + 1;
%         end
    end
    
%     plot(t, radius(t), 'r', 'LineWidth', 3)
%     legend('Actual', 'Experimental')
   
    hold on;
    plot(t, thetas, 'LineWidth', 3)
    plot(t, cos(omega*t)-1.5, 'r', 'LineWidth', 3)
    title('Examination of Frequency of Driven Pendulum', 'FontSize', 18)
    ylabel('Amplitude', 'FontSize', 14)
    xlabel('Time', 'FontSize', 14)
    legend('Oscillation in Swing', 'Cosine Wave oscillating at ideal frequency')
    
    %plot(t, thetadots)
    
%     subplot(1,3,1)
%     plot(thetas, KE)
%     subplot(1,3,2)
%    plot(t,PE)
%     subplot(1,3,3)
%%  Energy Validation Plotting Code

%     hold on
%     plot(t, PE+KE,'Color','b','LineWidth',3)
%     plot(t,PE,'Color','g','LineWidth',3)
%     plot(t, KE,'Color','m','LineWidth',3)
%     ylim([-12 4])
%     xlim([0 5])
%     xlabel('time (s)','FontSize',16)
%     ylabel('energy (J)','FontSize',16)
%     legend('total energy','potential enery','kinetic energy','FontSize',16)
%     title('Energy Validation of Pendulum without Variation in Length')

%%

%    plot(t, Y1);

%     subplot(1, 2, 1)
    %plot(t, radius(t), 'g', 'Linewidth', 2)
    
%     subplot(1, 2, 2)
%     plot(t, thetas)

%     for i=1:length(X1)
%        draw_func(X1(i), Y1(i));
%     end

    %res = Y1;
    
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
%        res = 1;
        res = beta * l * cos(a * omega * t + theta_init) + l; 
    end

    function res = r_dot(t)
%        res = 0;
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

