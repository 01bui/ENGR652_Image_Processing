%% part a
x = -4:0.1:4;
y = -4:0.1:4;
[X,Y] = meshgrid(x,y);
A = 1; B=2;     % Half of Width
XA = rectpuls(X,2*A);
YA = rectpuls(Y,2*A);
SignalA = XA.*YA; %% rectangular A

XB = rectpuls(X,2*B); 
YB = rectpuls(Y,2*B);
SignalB = XB.*YB; %% rectangular B   B>A
SignalB = imrotate(SignalB,60,'nearest');
figure;subplot(121); imagesc(x,y,SignalA);axis image;title('SignalA');colormap(gray);colorbar;
       subplot(122); imagesc(x,y,SignalB);axis image;title('SignalB');colormap(gray);colorbar;
Con = conv2(SignalA,SignalB,'same');
figure;imagesc(x,y,Con/max(Con(:))*(4));title('SignalA conv SignalB');colormap(gray);colorbar;