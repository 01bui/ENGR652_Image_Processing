function [ out ] = imlin2( in, a, b)
out = (in - min(in(:)))*(b - a)/((max(in(:)) - min(in(:))) + a;
end

