load kett
[sy,sx]=size(kett);

% make it odd for convenience in the final part of this file
% when we try to create an FIR inverse of odd size
kett=kett(1:sy-1,1:sx);
sy=sy-1;


h=ones(5,5)/25;
obs=conv2(softpad(kett,2,2,2,2),h,'valid')+randn(size(kett))*2;

dsftl(h,-2,-2);

figure
subplot(121)
imstd(kett)
title('Truth (Original)');
subplot(122)
imstd(obs)
title('Observed (degraded) 5x5 MA + N(0,2)');


[out1,HI1] = pseudoinv2d(obs,h,.01,0);
[out2,HI2] = pseudoinv2d(obs,h,.1,0);
[out3,HI3] = pseudoinv2d(obs,h,.5,0);

figure
subplot(221)
imstd(obs)
title('Observed (degraded) 5x5 MA + N(0,2)');
subplot(222)
imstd(out1)
title('Pseudo-Inverse T=.01');
subplot(223)
imstd(out2)
title('Pseudo-Inverse T=.1');
subplot(224)
imstd(out3)
title('Pseudo-Inverse T=.5');


figure
wx=linspace(-pi,pi,sx);
wy=linspace(-pi,pi,sy);
mesh(wx,wy,abs(fftshift(HI2)))
xlabel('\omega_1');
ylabel('\omega_2');
zlabel('|H_I(\omega_1,\omega_2)|');
title('Pseudo-Inverse T=.1');
view(-70,60)

figure
wx=linspace(-pi,pi,sx);
wy=linspace(-pi,pi,sy);
imstdxy(wx,wy,abs(fftshift(HI2)))
xlabel('\omega_1');
ylabel('\omega_2');
title('Pseudo-Inverse T=.1');


[out4,HI] = pseudoinv2d(obs,h,.1,0);
[out5,HI] = pseudoinv2d(obs,h,.1,20);
[out6,HI] = pseudoinv2d(obs,h,.1,100);


figure
subplot(221)
imstd(obs)
title('Observed (degraded) 5x5 MA + N(0,2)');
subplot(222)
imstd(out4)
title('Pseudo-Inverse T=.1, border=0');
subplot(223)
imstd(out5)
title('Pseudo-Inverse T=.1, border=20');
subplot(224)
imstd(out6)
title('Pseudo-Inverse T=.1, border=100');


%%%

hi2=real(ifft2(HI2));
figure
subplot(121)
imstdxy([0:sx-1],[0:sy-1],hi2)
title('Pseudo-Inverse T=.1 impulse response');
subplot(122)
hi2s=circshift(hi2,-(sx-1)/2-2,-(sy-1)/2-2);
imstdxy(linspace(-sx/2,sx/2,sx),linspace(-sy/2,sy/2,sy),hi2s);
title('Pseudo-Inverse T=.1 impulse response (zero centered)');

M=51;
b=(M-1)/2;
hifir=hi2s((sy+1)/2-b:(sy+1)/2+b,(sx+1)/2-b:(sx+1)/2+b);

figure
mesh([-b:b],[-b:b],hifir)
axis tight
xlabel('m');
ylabel('n');
zlabel('h_I(m,n)');
title('FIR inverse filter');

figure
imstdxy([-b:b],[-b:b],hifir)
xlabel('m');
ylabel('n');
zlabel('h_I(m,n)');
title('FIR inverse filter');

dsftl(hifir,-25,-25,128);

figure
test=conv2(softpad(obs,b,b,b,b),hifir,'valid');
subplot(221)
imstd(obs)
title('Observed (degraded) 5x5 MA + N(0,2)');
subplot(222)
imstd(test)
title('Pseudo-Inverse T=.1, 51x51 FIR linear convolution output');
subplot(223)
imstd(out6)
title('Pseudo-Inverse T=.1, circular conv output w/ 100 border padding');