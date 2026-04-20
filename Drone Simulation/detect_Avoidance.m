function [pos, near_miss] = detect_Avoidance(proposedPos, drones, index, params)
near_miss = 0;
pos = proposedPos;

pos(1) = max(1, min(params.rows, pos(1)));
pos(2) = max(1, min(params.cols, pos(2)));

for ii = 1:length(drones)
    if ii ~= index
        if isequal(pos, drones(ii).pos)
            pos = drones(index).pos;
            near_miss = 1;
            return;
        end
    end
end
end
