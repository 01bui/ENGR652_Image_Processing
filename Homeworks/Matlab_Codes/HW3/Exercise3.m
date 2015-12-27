%% a
clc, clear, close all;
delta_x=0.01;
delta_y=0.01;
x=-5:delta_x:5;
y=-5:delta_y:5;
N=length(x);
[X,Y] = meshgrid(x,y);
f = cos(pi*X);
figure, mesh(X,Y,f), colormap(gray(256)), view(0,90), title('f(x,y) = cos(\pix)'), xlabel('x'), ylabel('y'), zlabel('f(x,y)');
F = fft2(f);
a=1/(2*delta_x);
b=1/(2*delta_y);
u=[-a:2*a/N:a-2*a/N]';
v=[-b:2*b/N:b-2*b/N]';
figure, imagesc(u,v,fftshift(abs(F))), colormap(gray), title('F(u,v) Magnitude'), xlabel('u'), ylabel('v'), axis tight;

%% b
clc, clear, close all;
delta_x=0.01;
delta_y=0.01;
x=-5:delta_x:5;
y=-5:delta_y:5;
N=length(x);
[X,Y] = meshgrid(x,y);
f = 4*cos(2*pi*(0.5*(X-1)+2*(Y-1)));
figure, mesh(X,Y,f), colormap(gray(256)), view(0,90), title('f(x,y) = cos(\pix)'), xlabel('x'), ylabel('y'), zlabel('f(x,y)');
F = fft2(f);
a=1/(2*delta_x);
b=1/(2*delta_y);
u=[-a:2*a/N:a-2*a/N]';
v=[-b:2*b/N:b-2*b/N]';
figure, imagesc(u,v,fftshift(abs(F))), colormap(gray), title('F(u,v) Magnitude'), xlabel('u'), ylabel('v'), axis tight;

%% c
clc, clear, close all;
delta_x=0.1;
delta_y=0.1;
x=-5:delta_x:5;
y=-5:delta_y:5;
N=length(x);
[X,Y] = meshgrid(x,y);
% rect(x/2)
widthA = 2;
rect = rectpuls(X,widthA);
figure, mesh(X,Y,rect); title('rect'), axis tight;
figure, imagesc(x,y,rect); title('rect - top view'), axis tight;
% comb4(x)*impulse(y)
comb4 = zeros(length(x));
% from middle impulse, calculate the index of the impulses in front and
% after the middle impulse.
row_index_middle_impulse = floor(length(x)/2);
col_index_middle_impulse = floor(length(x)/2);
DELTA = 4/delta_x;
comb4(row_index_middle_impulse,col_index_middle_impulse-DELTA:DELTA:col_index_middle_impulse+DELTA) = 1;
figure, imagesc(x,y,comb4), colormap(gray), title('comb4(x)*impulse(y) - top view'), axis tight;
% f = rect(x/2)*comb4(x).impulse(y)
f = conv2(rect,comb4,'same');
figure, imagesc(x,y,f), colormap(gray(256)), title('f(x,y) = rect(x/2)*comb4(x).dirac(y)'), xlabel('x'), ylabel('y');
F = fft2(f);
a=1/(2*delta_x);
b=1/(2*delta_y);
u=[-a:2*a/N:a-2*a/N]';
v=[-b:2*b/N:b-2*b/N]';
figure, imagesc(u,v,fftshift(abs(F))), colormap(gray), title('F(u,v) Magnitude'), xlabel('u'), ylabel('v'), axis tight;

%% d
clc, clear, close all;
delta_x=0.1;
delta_y=0.1;
x=-100:delta_x:100;
y=-100:delta_y:100;
N=length(x);
[X,Y] = meshgrid(x,y);
% rect(x/4-y*sqrt(3)/4)
widthA = 1;
rect = rectpuls(X/4-Y*sqrt(3)/4,widthA).*rectpuls(X/4-Y*sqrt(3)/4,widthA);
figure, mesh(X,Y,rect); title('rect'), axis tight;
figure, imagesc(x,y,rect); title('rect - top view'), axis tight;
% comb8(x)*impulse(y)
comb8 = zeros(length(x));
row_index_middle_impulse = floor(length(x)/2);
col_index_middle_impulse = floor(length(x)/2);
DELTA = 8/delta_x;
comb8(row_index_middle_impulse,col_index_middle_impulse-10*DELTA:DELTA:col_index_middle_impulse+10*DELTA) = 1;
figure, imagesc(x,y,comb8), colormap(gray), title('comb8(x)*impulse(y) - top view'), axis tight;
% f = rect(x/4-y*sqrt(3)/4)*comb8(x)*impulse(y)
f = conv2(rect,comb8,'same');
figure, imagesc(x,y,f), colormap(gray(256)), title('f(x,y) = rect(x/2)*comb8(x).dirac(y)'), xlabel('x'), ylabel('y');
F = fft2(f);
a=1/(2*delta_x);
b=1/(2*delta_y);
u=[-a:2*a/N:a-2*a/N]';
v=[-b:2*b/N:b-2*b/N]';
figure, imagesc(u,v,fftshift(abs(F))), colormap(gray), title('F(u,v) Magnitude'), xlabel('u'), ylabel('v'), axis tight;

%% e
clc, clear, close all;
delta_x=0.1;
delta_y=0.1;
x=-5:delta_x:5;
y=-5:delta_y:5;
N=length(x);
[X,Y] = meshgrid(x,y);
widthA = 1;
rect = rectpuls(X,widthA).*rectpuls(Y,widthA);
figure, mesh(X,Y,rect); title('rect'), axis tight;
figure, imagesc(x,y,rect); title('rect - top view'), axis tight;
comb22 = zeros(length(x));
row_index_middle_impulse = floor(length(x)/2);
col_index_middle_impulse = floor(length(x)/2);
DELTA = 2/delta_x;
comb22(col_index_middle_impulse-2*DELTA:DELTA:col_index_middle_impulse+2*DELTA,col_index_middle_impulse-2*DELTA:DELTA:col_index_middle_impulse+2*DELTA) = 1;
figure, imagesc(x,y,comb22), colormap(gray), title('comb8(x)*impulse(y) - top view'), axis tight;
f = conv2(rect,comb22,'same');
figure, imagesc(x,y,f), colormap(gray(256)), title('f(x,y) = rect(x/2)*comb8(x).dirac(y)'), xlabel('x'), ylabel('y');
F = fft2(f);
a=1/(2*delta_x);
b=1/(2*delta_y);
u=[-a:2*a/N:a-2*a/N]';
v=[-b:2*b/N:b-2*b/N]';
figure, imagesc(u,v,fftshift(abs(F))), colormap(gray), title('F(u,v) Magnitude'), xlabel('u'), ylabel('v'), axis tight;


