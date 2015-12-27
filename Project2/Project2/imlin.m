function out=imlin(in,G,B);
%
% out=imlin(in,G,B);
%
% Maps 'in' into a range of 0-255 for
% grayscale image display.
% It maps the higest value in 'in' to 255 and
% the lowest to 0.  It maps in between values linearly.
%
% in        Input image
% out       Scaled output image
% G         Optional gain to apply after 8-bit mapping
% B         Optional bias to apply after 8-bit mapping
%
% Author: Dr. Russell Hardie
% University of Dayton

% make double if it is not
in=double(in); 

% map into 0-255 range
out=in-min(in(:));
out=out*255/max(out(:));

% do additional linear mapping
if nargin < 3
    B=0;
end
if nargin < 2
    G=1;
end

out=G*out+B;

% display result
image(out);
colormap(gray(256));
axis image;
