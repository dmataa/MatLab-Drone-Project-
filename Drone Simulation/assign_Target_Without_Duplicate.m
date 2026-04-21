function target = assign_Target_Without_Duplicate(fire, drones)
    [rows, cols] = size(fire.intensity);
    maxVal = -1;
    target = [];
    for ii = 1:rows
        for jj = 1:cols
            val = fire.intensity(ii,jj);
            if val > maxVal
                isTaken = false;
                for k = 1:length(drones)
                    if isequal([ii jj], drones(k).target)
                        isTaken = true;
                        break;
                    end
                end

                if ~isTaken
                    maxVal = val;
                    target = [ii jj];
                end

            end
        end
    end

    if maxVal < 0.1
        target = [];
    end

end