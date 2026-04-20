function[drone, fire] = update_Drone(drone, fire, params, drones, index)
if isempty(drone.target) || fire.intensity(drone.target(1), drone.target(2)) < 0.1
    drone.target = assign_Target(fire);
end
proposedPos = move_Drone(drone.pos, drone.target);
[safePos, near_miss] = detect_Avoidance(proposedPos, drones, index, params);
drone.distance = drone.distance + norm(safePos - drone.pos);
drone.pos = safePos;
drone.near_miss = drone.near_miss + near_miss;
if ~isempty(drone.target)
    if all(drone.pos == drone.target)
        fire.intensity(drone.pos(1), drone.pos(2)) = 0;
        drone.cells_extinguished = drone.cells_extinguished + 1;
        drone.target = [];
    end
end
drone.log(end + 1, :) = [drone.pos, drone.target];
end
