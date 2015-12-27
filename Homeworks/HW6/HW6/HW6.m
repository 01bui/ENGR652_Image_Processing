clc, clear, close all;
% Load pout.tif image and display the size
img = double(imread('pout.tif'));
[sy,sx]=size(img);
im(img);
% Rotation matrix
theta=pi/4;
T=[cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1];
a = [1 0 0;0 1 0; -floor(sx/2) -floor(sy/2) 1];
b = [1 0 0;0 1 0; floor(sx/2) floor(sy/2) 1];
T = a*T*b;
tform=maketform('affine',T);
% Input pixel coordinates using meshgrid
[W,Z]=meshgrid(1:sx,1:sy);
IN = [W(:)'; Z(:)'];
OUT = tformfwd(IN',tform)';
X = clip(OUT(1,:), 1, sx);
Y = clip(OUT(2,:), 1, sy);
X = reshape(X, sy,sx);
Y = reshape(Y, sy,sx);
out = interp2( W,Z,img, X,Y, 'bil' );
im(out);