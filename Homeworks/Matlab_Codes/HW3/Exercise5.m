%% Exercise 5a
clear, clc, close all;
delta_x=0.1;
delta_y=0.1;
x=-8:delta_x:8;
y=-8:delta_y:8;
N=length(x);
f = (checkerboard(8, 4, 8) > 0.5);
f = double(f);
figure, imagesc(x, y, f), colormap(gray(256));
% Find u,v coordinates
a=1/(2*delta_x);
b=1/(2*delta_y);
u=[-a:2*a/N:a-2*a/N]';
v=[-b:2*b/N:b-2*b/N]';
% fft 
F = fft2(f);
figure, imagesc(u,v,fftshift(abs(F))), colormap(gray), title('F(u,v) Magnitude'), xlabel('u'), ylabel('v'), axis tight;

%% Exercise 5b
clear, clc, close all;
delta_x=0.1;
delta_y=0.1;
x=-20:delta_x:20;
y=-20:delta_y:20;
N=length(x);
s = zeros(20);
r = ones(10,20);
S = [r;s;r;s;r;s;r;s;r;s;r;s;r;s;r;s;r;s;r;s;r;s;r;s;r;s;r];
b = zeros(N,20);
w = ones(N,10);
Signal = [b w S w b w S w b w S w b w S w b w S w b w S w b w S w];
imagesc(x,y,Signal);
% Find u,v coordinates
a=1/(2*delta_x);
b=1/(2*delta_y);
u=[-a:2*a/N:a-2*a/N]';
v=[-b:2*b/N:b-2*b/N]';
% fft
F = fft2(Signal);
figure, imagesc(u,v,fftshift(abs(F))), colormap(gray), title('F(u,v) Magnitude'), xlabel('u'), ylabel('v'), axis tight;

%% Exercise 5c
clear, clc, close all;
delta_x=0.1;
delta_y=0.1;
x=-6:delta_x:6;
y=-6:delta_y:6;
N=length(x);
[X,Y]=meshgrid(x,y);
rect = rectpuls(-X+Y+0.5,1)+rectpuls(-X+Y-4+0.5,1)+rectpuls(-X+Y+4+0.5,1)+rectpuls(-X+Y-8+0.5,1)+rectpuls(-X+Y+8+0.5,1)+rectpuls(-X+Y-12+0.5,1);
figure, mesh(X,Y,rect); title('rect'), axis tight;
figure, imagesc(x,y,rect); title('rect - top view'), axis tight;
% Find u,v coordinates
a=1/(2*delta_x);
b=1/(2*delta_y);
u=[-a:2*a/N:a-2*a/N]';
v=[-b:2*b/N:b-2*b/N]';
% fft
F = fft2(rect);
figure, imagesc(u,v,fftshift(abs(F))), colormap(gray), title('F(u,v) Magnitude'), xlabel('u'), ylabel('v'), axis tight;

