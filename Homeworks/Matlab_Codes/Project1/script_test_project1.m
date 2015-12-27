clear,clc
load 'JPCNN001_small.mat';
%Extracting chest x-ray image
I = jrst.cxr;
in = I;
out = my_local_contrast(in,51,16);
[ gain_in, bias_in, im_in ] = im(in,1);
[ gain_out, bias_out, im_out ] = im(out,1);