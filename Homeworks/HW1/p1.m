%% ENGR 652 - Homework 1 - Problem 1 - Vy Bui
clear, clc
I = imread('vyself.jpg');
figure, imshow(I);
C = imcrop(I,[360 160 320 320]);
figure, imshow(C);
R = imresize(C, [128 128]);
figure, imshow(R);
picture = rgb2gray(R);
save bui picture
figure, imshow(picture);