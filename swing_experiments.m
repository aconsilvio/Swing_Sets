function res = swing_experiments()
    data = load('SwingData2.csv');
    time = data(:,1);
    x_center = data(:,2);
    y_center = data(:,3);

    hold on
%     plot(x_center, y_center)
%     title('Position of COM During Swinging')
%     xlabel('x position')
%     ylabel('y position')
    
%     plot(time, y_center+2,'LineWidth',2)
%     title('Height of COM on Swing Over Time','FontSize',20)
%     xlabel('time (s)','FontSize',16)
%     ylabel('height (m)','FontSize',16)
    
    %plot(time, atan(x_center/y_center))
    %title('Theta over Time')
    %xlabel('time')
    %ylabel('theta (radians)')
    
    
    for i=2:length(time)
        frequency(i-1) = (atan(x_center(i)/y_center(i)) - atan(x_center(i-1)/y_center(i-1)))/(time(i)-time(i-1));
        time2(i-1) = time(i);
    end
    
%     plot(time2, frequency,'LineWidth',2)
%     title('Freqency over Time','FontSize',20)
%     xlabel('time (s)','FontSize',16)
%     ylabel('frequency (rad/s)','FontSize',16)
    
    for i=1:length(x_center)
        len(i) = sqrt(x_center(i)^2 + y_center(i)^2);
    end

    plot(time, len,'LineWidth',2)
    xlabel('Time (s)','FontSize',16)
    ylabel('Length of Swing (m)','FontSize',16)
    title('Length of the Pendulum as a function of time','FontSize',20)
    

end