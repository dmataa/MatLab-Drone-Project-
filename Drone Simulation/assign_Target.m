function target = assign_Target(fire) 
    [rows, cols] = size(fire.intensity);
    maxVal = fire.intensity(1,1);
    target = [1,1];

    for ii = 1:rows
        for jj = 1:cols
            if fire.intensity(i,j) > maxVal
                maxVal = fire.intensity(i,j);
                target = [i,j];
            end
        end
    end
    if maxVal < 0.1
        target = [];
    end
end