function [drone, fire] = update_Drone(drone, fire, params, oldDrones, index)
    if isempty(drone.target)
        drone.target = assign_Target(fire);
    end
    if ~isempty(drone.target)
    taken = false;
    for ii = 1:length(oldDrones)
        if ii ~= index && isequal(drone.target, oldDrones(ii).target)
            taken = true;
            break;
        end
    end
    if taken
        drone.target = assign_Target_Without_Duplicate(fire, oldDrones);
    end
    end
    if isempty(drone.target)
        drone.log(end+1,:) = [drone.pos, NaN, NaN];
        return;
    end
    proposedPos = move_Drone(drone.pos, drone.target);
    [safePos, near_miss] = detect_Avoidance(proposedPos, oldDrones, index, params);
    drone.distance = drone.distance + norm(safePos - drone.pos);
    drone.pos = safePos;
    drone.near_miss = drone.near_miss + near_miss;
    if all(drone.pos == drone.target)
        fire.intensity(drone.pos(1), drone.pos(2)) = ...
            max(0, fire.intensity(drone.pos(1), drone.pos(2)) - params.water_power);
        drone.cells_extinguished = drone.cells_extinguished + 1;
        drone.target = [];
    end
    if isempty(drone.target)
        drone.log(end+1,:) = [drone.pos, NaN, NaN];
    else
        drone.log(end+1,:) = [drone.pos, drone.target];
    end
end
