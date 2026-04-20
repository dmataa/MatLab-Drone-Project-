function proposedPos = move_Drone(currentPos, target)
if isempty(target)
    proposedPos = currentPos;
    return;
end
direction = sign(target - currentPos);
proposedPos = currentPos + direction;
end
