function C=clip(c,minn,maxx) 
%
% function C=clip(c,minn,maxx) 
%
% Clipping function.  Takes any c (scalar, vector or matrix)
% and clips each value with the limits of minn and maxx.
% 
%
% C		Clipped version of c
%
% c		Input scalar, vector or matrix.
%
% minn		Minimum value of C
% maxx		Maximum value of C
%
% Author: Dr. Russell C. Hardie  9/23/96


% initialize output to be input
C=c;

% find all positions with values below minn
Imin=find(c<minn);

% find all positions with values above maxx
Imax=find(c>maxx);

% Replave all sub minn values with minn
C(Imin)=minn*ones(size(Imin));

% Replave all above maxx values with maxx
C(Imax)=maxx*ones(size(Imax));
