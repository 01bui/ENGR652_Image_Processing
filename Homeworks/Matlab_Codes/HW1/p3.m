%% ENGR 652 - Homework 1 - Problem 3 - Vy Bui
function avg_I = p3(array)
if ndims(array) > 2
    error('The input must be 1D or 2D array')
else
array_1D = array(:);
avg_I = sum(array_1D)/length(array_1D);
end
end