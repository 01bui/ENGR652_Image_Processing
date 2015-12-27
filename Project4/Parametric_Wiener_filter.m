function [out,HI] = Parametric_Wiener_filter(in,psf,border,gamma, sx, sy, P)
%
%   Does 2D pseudo-inverse with NSR DFT Filtering 
%
%   out    - filtered signal
%   HI - filter DFT samples
%   in     - input signal
%   psf    - FIR impulse response of degradation process 
%	thresh    - threshold (~ .001 - .1)
%	border - border padding size to minimize ringing artifacts (~20)
%   P      - DSFT of high pass filter
%   gamma  - noise variance
% Author: Dr. Russell Hardie
% UD 3/25/99

% Pad image and get new size
in=softpad(in,border,border,border,border);
[L1,L2]=size(in);

% Create filter DFT
%disp('Generate Pseudo-Inverse Filter')
H=fft2(psf,L1,L2);

% Do thresholding
dsft_P = fft2(P,sy + 2 * border,sx + 2 * border); % Equation 4
magnitude_P_squared = abs(dsft_P.^2); % Equation 3
NSR = gamma*magnitude_P_squared; 
HI=conj(H)./(abs(H.^2)+NSR);

% Filter and Compute inverse DFT
%disp('Perform Filtering')

%flops(0);
X=fft2(in,L1,L2);
out=real(ifft2(HI.*X));

% circularly shift output to compensate for the
% PSF being defined in the 1st quadrant (circ shifted
% with respect to 0,0.
[psfy,psfx]=size(psf);
out=mycircshift(out,-round((psfx-1)/2),-round((psfy-1)/2));

% cut out original image size
out=out(1+border:L1-(border),1+border:L2-(border));
end