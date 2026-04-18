function fire = fire_step(fire, params)
% fire_step - Advances fire intensity by one time step.
%
% Inputs:
% fire   (struct) - current fire state (.intensity matrix, rows x cols)
% params (struct) - .spread_rate, .decay_rate, .rows, .cols
%
% Output:
% fire(struct)- updated fire state

[rows, cols] = size(fire.intensity);
spread_rate  = params.spread_rate;
decay_rate   = params.decay_rate;

% Step 1: Orthogonal Spread 
spread = zeros(rows, cols);

for r = 1:rows
    for c = 1:cols
        intensity_rc = fire.intensity(r, c);

        if intensity_rc > 0    % only burning cells spread

            % North neighbor
            if r - 1 >= 1
                spread(r-1, c) = spread(r-1, c) + intensity_rc * spread_rate;
            end

            % South neighbor
            if r + 1 <= rows
                spread(r+1, c) = spread(r+1, c) + intensity_rc * spread_rate;
            end

            % West neighbor
            if c - 1 >= 1
                spread(r, c-1) = spread(r, c-1) + intensity_rc * spread_rate;
            end

            % East neighbor
            if c + 1 <= cols
                spread(r, c+1) = spread(r, c+1) + intensity_rc * spread_rate;
            end

        end
    end
end

% Apply accumulated spread to the intensity grid
fire.intensity = fire.intensity + spread;

% Step 2: Global Decay
% Subtract a small constant from every cell each step. 
% decay_rate is tuned in make_params.
fire.intensity = fire.intensity - decay_rate;

% Step 3: Clamp to [0, 1]
% Prevents negative values (over-cooled) and values > 1
fire.intensity = clamp01(fire.intensity);

end