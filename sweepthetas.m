function sweepthetas(accuracy)
    omegas = linspace(0, 25, accuracy);
    
    for i=1:accuracy
       max_height(i) = max(swingthetasweep(omegas(i)));
    end
    
    plot(omegas, max_height, 'b', 'LineWidth', 3)
    xlabel('Frequency of Pumping')
    ylabel('Maximum Height Achieved')
    title('Frequency of Pumping as a function of Maximum Height Achieved')

end