function sweepthetas(accuracy)
    omegas = linspace(1, 4, accuracy*3);
%     lengths = linspace(1, 15, accuracy);
%     
%     for p=1:accuracy
%         for i=1:accuracy
%             max_height(i) = max(swingthetasweep(lengths(p), omegas(i)));
%         end
%         [M, I] = max(max_height);
%         max_ratio(p) = omegas(I)/sqrt(10/lengths(p));
%     end

    for p=1:accuracy*3
        max_height(p) = max(swingthetasweep(omegas(p)));
    end
    
%     plot(lengths, max_ratio)
%     xlabel('Length of Pendulum')
%     ylabel('Ratio of Optimal Frequency to Natural Frequency')
%     title('Optimal Frequency to Natural Frequency Ratio versus Rest Length of Pendulum')
%    pcolor(omegas, lengths, max_height)

    [M, I] = max(max_height);
    
    disp(omegas(I));
    
    plot(omegas, max_height, 'b', 'LineWidth', 3)
    xlabel('Frequency of Pumping')
    ylabel('Maximum Height Achieved')
    title('Frequency of Pumping as a function of Maximum Height Achieved')

end