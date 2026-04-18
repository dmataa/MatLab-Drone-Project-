clear, clc 
% Step 1 - build params
params = make_params()

% Step 2 - build the fire grid
fire = init_fire(params)

% Step 3 - check the initial state visually
imagesc(fire.intensity)
colorbar
title('Initial fire state')

% Step 4 - run and check if it spreads 
for step = 1:20
    fire = fire_step(fire, params);
end

% Step 5 - check the result
imagesc(fire.intensity)
colorbar
title('Fire after 20 steps')