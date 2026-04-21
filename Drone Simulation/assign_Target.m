function target = assign_Target(fire) 
    [rows, cols] = size(fire.intensity);
    maxVal = fire.intensity(1,1);
    target = [1,1];
    for ii = 1:rows
        for jj = 1:cols
            if fire.intensity(ii,jj) > maxVal
                maxVal = fire.intensity(ii,jj);
                target = [ii,jj];
            end
        end
    end
    if maxVal == 0
    target = [];
    end
end
