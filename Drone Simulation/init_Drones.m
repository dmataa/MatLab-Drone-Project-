function drones = init_Drones(params)
    for ii = 1:params.numDrones
        drones(ii).pos = [randi(params.rows), randi(params.cols)];
        drones(ii).target = [];
        drones(ii).log = [];
        drones(ii).distance = 0;
        drones(ii).near_miss = 0;
        drones(ii).cells_extinguished = 0;
    end
end
