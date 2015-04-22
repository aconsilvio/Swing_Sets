function sweepthetas(accuracy)
    omegas = linspace(0, 25, accuracy);
    
    for i=1:accuracy
       max_height(i) = max(swingthetasweep(omegas(i)));
    end
    
    plot(omegas, max_height)

end