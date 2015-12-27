clc
clear all
close all
% Load the kett.mat image
load kett
% Generate a 9x1 (horizontal) moving avg impulse response
h = fspecial('motion'); %default is 9
% Convole this with the kett image
[sy,sx] = size(kett);
original_img=kett(1:sy-1,1:sx);
sy=sy-1;
motion_img = conv2(softpad(original_img,0,4,0,4),h,'valid');
% Add Gaussian noise with std = 2
motion_noise_img = motion_img + 2*randn(sy,sx);
% Show the magnitude and freq. response of the 9x1 MA filter
dsftl(h);
% Show the original and corrupted image
figure, imagesc(original_img), colormap(gray(256)), title('Original Image'), axis image;
figure, imagesc(motion_noise_img), colormap(gray(256)), title('Corrupted Image'), axis image;
% Show the magnitude spectrum of original and corrupted images
imspecxy(original_img,100)
title('The magnitude spectrum of the original image');
imspecxy(motion_noise_img,100)
title('The magnitude spectrum of the corrupted image');
MAE_unfiltered_img = mean(mean(abs(motion_noise_img-original_img)));

%% Pseudo-inverse
Threshold = logspace(-2,0,20);
i = 1;
while i <= 20,
    % Set the parameter border = 100 in pseudoinv2d.m
    [out,HI] = pseudoinv2d(motion_noise_img,h,Threshold(i),100);
    % Compute MAE between each and the original
    mean_absolute_error(i) = mean(mean(abs(out-original_img)));
    i = i + 1;
end
% Showing MAE vs. the threshold value
figure
semilogx(Threshold,mean_absolute_error, '-o', 'MarkerEdgeColor','r');
title('MAE vs. the threshold value');
xlabel('Threshold value');
ylabel('MAE');
% Show the restored image using the best MAE 
[min_MAE_value,min_MAE_index] = min(mean_absolute_error);
[out,HI] = pseudoinv2d(motion_noise_img, h, Threshold(min_MAE_index), 100);
figure, imagesc(out), colormap(gray(256)), title('The restored image of the pseudo invert filter'), axis image;
MAE_Pseudo_inverse = min_MAE_value;
% Show the magnitude spectrum
imspecxy(out,100)
title('The magnitude frequency of the restored image of the pseudo-invert filter');

%% NSR_Wiener_filter
NSR = logspace(-3,-1,20);
i = 1;
while i <= 20,
    % Set the parameter border = 100 in NSR_Wiener_filter.m
    [out,HI] = NSR_Wiener_filter(motion_noise_img,h,100,NSR(i));
    % Compute MAE between each and the original
    mean_absolute_error(i) = mean(mean(abs(out-original_img)));
    i = i + 1;
end
% Showing MAE vs. the threshold value
figure
semilogx(Threshold,mean_absolute_error, '-o', 'MarkerEdgeColor','r');
title('MAE vs. the threshold value');
xlabel('Threshold value');
ylabel('MAE');
% Show the restored image using the best MAE 
[min_MAE_value,min_MAE_index] = min(mean_absolute_error);
[out,HI] = NSR_Wiener_filter(motion_noise_img, h, 100, NSR(min_MAE_index));
figure, imagesc(out), colormap(gray(256)), title('The restored image of the NSR Wiener filter'), axis image;
MAE_NSR_Wiener_filter = min_MAE_value;
% Show the magnitude spectrum
imspecxy(out,100)
title('The magnitude frequency of the restored image of the NSR Wiener filter');

%% Parametric_Wiener_filter
P = [0 -1 0; -1 4 -1; 0 -1 0];
gamma = logspace(-3,-1,20);
i = 1;
while i <= 20,
    % Set the parameter border = 100
    [out,HI] = Parametric_Wiener_filter(motion_noise_img, h, 100, gamma(i), sx, sy, P);
    mean_absolute_error(i) = mean(mean(abs(out-original_img)));
    i = i + 1;
end
% Showing MAE vs. the threshold value
figure
semilogx(Threshold,mean_absolute_error, '-o', 'MarkerEdgeColor','r');
title('MAE vs. the threshold value');
xlabel('Threshold value');
ylabel('MAE');
% Show the restored image using the best MAE 
[min_MAE_value,min_MAE_index] = min(mean_absolute_error);
[out,HI] = Parametric_Wiener_filter(motion_noise_img, h, 100, gamma(min_MAE_index), sx, sy, P);
figure, imagesc(out), colormap(gray(256)), title('The restored image of the Parametric Wiener filter'), axis image;
MAE_Parametric_Wiener_filter = min_MAE_value;
% Show the magnitude spectrum
imspecxy(out,100)
title('The magnitude frequency of the restored image of the Parametric Wiener filter');

%% Table of the minimum MAE's for the three filters along with the MAE for the unfiltered image
MAE = [MAE_unfiltered_img;MAE_Pseudo_inverse;MAE_NSR_Wiener_filter;MAE_Parametric_Wiener_filter]
