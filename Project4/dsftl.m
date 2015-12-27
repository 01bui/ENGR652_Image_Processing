function dsftl(h,shy,shx,N);
%
% dsftl(h,shy,shx,N);
% 
%  Discrete-Space Fourier Transform
%  Shown as a lighted grayscale surface.
% 
%  h is array with lower left value assumed to be at m=0,n=0
%  The displayed spectrum is for any shifted version
%  of this h array:   DSFT { h(m-shx,n-shy) }
%  Note that a negative shx,shy means we are computing 
%  the spectrum of h shifted left and down
%
% h             Input array
%
% shx,shy       Optional.  Shift amount in x and y
%               (default shx=shy=0).
%
% N             Optional.  Number of frequency points 
%               to compute and plot (default=64).
%
% Author: Dr. Russell Hardie
% University of Dayton
% 3/1/02


if nargin < 4
    N=64;
end

if nargin < 2
    shx=0;
    shy=0;
end

 
H=fft2(h,N,N);

[sy,sx]=size(h);
k=2*pi*[0:N-1]/N;
[K1,K2]=meshgrid(k,k);
S=exp(-j*(K1*shx+K2*shy));

Y=fftshift(H.*S);

w1=linspace(-pi,pi,N);
w2=linspace(-pi,pi,N);


figure
subplot(211)
surfl(w1,w2,abs(Y));
shading interp
colormap(gray(256))
xlabel('\omega_1 (radians/sample)');
ylabel('\omega_2 (radians/sample)');
zlabel('|H(\omega_1,\omega_2)|');
axis tight
title('Magnitude');

subplot(212)
surfl(w1,w2,angle(Y));
shading interp
colormap(gray(256))
xlabel('\omega_1 (radians/sample)');
ylabel('\omega_2 (radians/sample)');
zlabel('\angle H(\omega_1,\omega_2)');
axis tight
title('Phase');



