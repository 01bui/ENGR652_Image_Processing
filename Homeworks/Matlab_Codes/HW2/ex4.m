clear
clc
%% Convolution image using 2D Gaussion
x = double(imread('cameraman.tif'));
figure
image(x)
colormap(gray(256));
title('Original Image');
% Gauss_filter = fspecial('gaussian', [5 5], 3);
hx = fspecial('gaussian',[1,5],3) ; 
hy = fspecial('gaussian',[5,1],3) ; 
hx2=repmat(hx,[5,1]); 
hy2=repmat(hy,[1,5]); 
h=hx2.*hy2;
tic
conv2D = conv2(x,h,'same');
toc
figure
image(conv2D);
colormap(gray(256));
title('Convolution image using 2D Gaussion');
%% Convolution image using 1D Gaussion
row_Gauss = fspecial('gaussian',[1,5],3); 
col_Gauss = fspecial('gaussian',[5,1],3) ;
[row col] = size(x);
im_row = reshape(x',1,row*col);
tic
row_conv = conv(im_row,row_Gauss,'same');
toc
row_conv = reshape(row_conv, col, row);
row_conv = row_conv';
im_col = (row_conv(:))';
tic
col_conv = conv(im_col,col_Gauss','same');
toc
col_conv = reshape(col_conv, row, col);
figure
image(col_conv);
colormap(gray(256));
title('Convolution image using seperated Gaussian vector filter');
%% Compare conv 1D and 2D
diff = conv2D - col_conv;
figure
imshowpair(conv2D,col_conv,'diff');