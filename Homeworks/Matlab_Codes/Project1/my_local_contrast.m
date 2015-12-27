function out = my_local_contrast(in, window_size, gauss_std );
% Performs a local contrast enhancement using a gaussian smoothing function
% of specified size and standard deviation and uses mirror padding to treat border effects.
%
% Required Input Parameters: in - chest X-ray image (double precision format).
% window_size - averaging filter size (odd integer number).
% gauss_std - desired standard deviation
%
% Outputs: out - enhanced chest X-ray image (output is double precision format)
%
%% Two one dimensional Gaussian filters (seperable filters)
filter_size = window_size;
hx = fspecial('gaussian',[1,filter_size],gauss_std) ; 
hy = fspecial('gaussian',[filter_size,1],gauss_std) ; 
%% Convert the image to double precision variable
in = double(in);
%% Compute the mirror padding window size for border effect
mirror_padding = padarray(in,[(window_size-1)/2 (window_size-1)/2],'symmetric','both');
[ gain_in, bias_in, im_in ] = im(mirror_padding,1);
%% Compute local mean
% 1D Convolution along each row 
[row_pad,col_pad] = size(mirror_padding);
im_row = reshape(mirror_padding',1,row_pad*col_pad);
row_conv = conv(im_row,hx,'same');
row_conv = reshape(row_conv, col_pad, row_pad);
row_conv = row_conv';
% 1D convolution along each column  
im_col = (row_conv(:))';
col_conv = conv(im_col,hy','same');
col_conv = reshape(col_conv, row_pad, col_pad);
h = col_conv;
u = h;
%% Compute x^2
x_square = mirror_padding.^2;
%% Compute local mean squared
local_mean_squared = u.^2;
%% Compute expectation of the signal squared (seperable filters)
[row_x_square,col_x_square] = size(x_square);
im_row_x_square = reshape(x_square',1,row_x_square*col_x_square);
row_x_square_conv = conv(im_row_x_square,hx,'same');
row_x_square_conv = reshape(row_x_square_conv, col_x_square, row_x_square);
row_x_square_conv = row_x_square_conv';
% 1D convolution along each column  
im_col_x_square = (row_x_square_conv(:))';
col_x_square_conv = conv(im_col_x_square,hy','same');
col_x_square_conv = reshape(col_x_square_conv, row_x_square, col_x_square);
e_signal_squared = col_x_square_conv;
%% Compute std squared 
std_squared = e_signal_squared - local_mean_squared;
%% Assuring std squared is positive
std_squared = abs(std_squared);
%% Handling zero std region
std_squared(find(std_squared < 0.01)) = 0;
%% Perform a local contrast enhancement on the image
out = 64*(mirror_padding - u)./sqrt(std_squared)+127;
% crop the mirror padding
out = out((window_size-1)/2+1:row_pad-(window_size-1)/2,(window_size-1)/2+1:col_pad-(window_size-1)/2); 
end



