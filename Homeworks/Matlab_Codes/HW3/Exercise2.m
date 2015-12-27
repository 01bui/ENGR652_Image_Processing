%% Rect case
clear, clc, close all;
% [X,Y] = meshgrid(-5:.01:5);
% widthA = 1;
% widthB = 2;
% rectA = 0.5*(sign(X/widthA + 0.5) - sign(X/widthA - 0.5));
% rectB = 0.5*(sign(Y/widthB + 0.5) - sign(Y/widthB - 0.5));
% Z = rectA.*rectB;
% figure, mesh(X,Y,Z);

[X,Y] = meshgrid(-3:.01:3);
widthA = 1;
rectA = rectpuls(X,widthA).*rectpuls(Y,widthA);
figure, mesh(X,Y,rectA); title('rectA'), axis tight;

widthB = 2;
rectB = rectpuls(X,widthB).*rectpuls(Y,widthB);
figure, mesh(X,Y,rectB); title('rectB'), axis tight;

conv2D_AB = conv2(rectA, rectB,'same');
figure, mesh(X,Y,conv2D_AB), title('Conv2D of rectA and rectB'), axis tight;

%% Circular case
clear, clc, close all;

[X,Y] = meshgrid(-3:.01:3);
R = sqrt(X.^2+Y.^2); % circ(x,y) ~ rect(sqrt(x^2+y^2)) - slide 5
width1 = 2;
circ1 = rectpuls(R,width1).*rectpuls(R,width1);
figure, mesh(X,Y,circ1); title('circ1'), axis tight;

width2 = 2;
circ2 = rectpuls(R,width2).*rectpuls(R,width2);
figure, mesh(X,Y,circ2); title('circ2'), axis tight;

conv2D_circ = conv2(circ1, circ2,'same');
figure, mesh(X,Y,conv2D_circ), title('Conv2D of circ1 and circ2'), axis tight;





