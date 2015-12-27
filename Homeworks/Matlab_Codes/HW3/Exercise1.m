clear,clc,close all;
[X,Y] = meshgrid(-10:.05:10);
% R = sqrt(X.^2 + Y.^2) + eps;
% Z = sin(R)./R;
Z = sinc(X).*sinc(Y);
figure, mesh(X,Y,Z), axis tight;
out = imlin2( Z, 0, 255);
figure, im_Z = image(out), colormap(gray), axis tight;