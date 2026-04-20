function drones = init_Drones(params)
    for i = 1:params.numDrones
        drones(i).pos = [randi(params.gridSize(1)), randi(params.gridSize(2))];
        drones(i).target = [];
        drones(i).log = [];
    end
end