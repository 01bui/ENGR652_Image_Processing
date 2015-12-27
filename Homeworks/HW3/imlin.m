function [ out ] = imlin( in, G, B)
out = (in - min(in(:)))*255/(max(in(:)) - min(in(:)));
out = G * out + B;
end