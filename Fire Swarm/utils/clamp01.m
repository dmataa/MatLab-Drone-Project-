function M = clamp01(M)
% clamp01 - Clamps all values in matrix M to the range [0, 1].
%
% Input/Output:
%   M - numeric matrix

M = max(0, min(1, M));

end