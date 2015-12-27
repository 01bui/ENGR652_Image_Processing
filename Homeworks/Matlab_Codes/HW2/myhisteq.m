function [out,F]=myhisteq(in,L);
%
% [out,F]=myhisteq(in,L);
%
% My histogram equalization function
% Takes an L level input image 'in' (must be integers)
% and maps it to an L Level output
% with an approximately flat histogram.
%
% out       equalized image (L levels)
% F         mapping function
% in        input image (L levels, integer values)
% L         # levels in input image
im_size = size(in);
row = im_size(1);
col = im_size(2);
total_pixels = row*col;
j = 1;
s = 0;
out = in;
for rk = 0:L-1;
    nk(j) = length(find(in == rk)); 
    pr(j) = nk(j)/total_pixels;
    s = s + (L-1)*pr(j);
    sk(j) = s;
    out(find(in == rk)) = sk(j);  
    j = j + 1; 
end
F = sk;
end

