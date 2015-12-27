% Compare execution time of the convolution command assuming separable and 
% unseparable functions.
%%
clc
clear all
x=double(imread('cameraman.tif'));
hx = fspecial('gaussian',[1,4],3);
hy = fspecial('gaussian',[4,1],3);
h = fspecial('gaussian',[4,4],3);

tic
y_x=conv2( padarray( x, [0,4 ], 'symmetric', 'both' ), hx, 'valid');
y_y=conv2( padarray( y_x, [4,0 ], 'symmetric', 'both' ), hy, 'valid');
im(y_y);
toc

tic
y=conv2( padarray( x, [4,4], 'symmetric', 'both' ), h, 'valid');
im(y);
toc
% you can try this too
tic
y = conv2(hy,hx,padarray(x,[4,4],'symmetric', 'both'),'valid');
im(y);
toc
