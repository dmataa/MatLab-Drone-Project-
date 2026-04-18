function fire = init_fire(params)
% init_fire - Creates the initial fire state struct.
%
% Input:
% params(struct) - simulation settings (rows, cols, seed)
%
% Output:
% fire (struct)
%     .intensity  - rows x cols matrix, values in [0,1]
%                   0 = no fire, 1 = fully burning
%
% Three hotspots are seeded so the drone swarm has meaningful targets.
% Each hotspot is a small 3x3 block of intensity 1.0 placed in
% different quadrants so all three drones get independent objectives.

if ~isempty(params.seed)
    rng(params.seed);              
end

% Start with a cold grid
fire.intensity = zeros(params.rows, params.cols);

% Hotspot definitions: [center_row, center_col] 
% Placed in three different quadrants; keep at least 5 cells from edges.
hotspots = [   7,  7; % top left 
               7, 24;    % top right 
               24, 15;]  % bottom center

radius = 1;   % hotspot half width in cells 

for k = 1:size(hotspots, 1)
    r0 = hotspots(k, 1);
    c0 = hotspots(k, 2);
    for dr = -radius:radius
        for dc = -radius:radius
            r = r0 + dr;
            c = c0 + dc;
            if r >= 1 && r <= params.rows && c >= 1 && c <= params.cols
                fire.intensity(r, c) = 1.0;
            end
        end
    end
end

end