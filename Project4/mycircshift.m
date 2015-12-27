function [frame] = mycircshift(frame,shx,shy);%
% [frame] = circshift(frame,shx,shy);% 
% Circularly shifts an image by shx,shy %
% frame			The shifted image and image to be shifted%
% shx			horizontal shift in terms of # of pixels
% shy			vertical shift in terms of # of pixels

[ydim,xdim]=size(frame);

% Circularly shift the high resolution image by sx,sy

% Horizontal shifts
if shx > 0
		% if positive put this from the left side to the right side.
		ls=frame(:,1:shx);
		frame=[frame(:,shx+1:xdim),ls];
elseif  shx < 0
		% if negative put this from the right side to the left side.
		rs=frame(:,xdim+shx+1:xdim);
		frame=[rs,frame(:,1:xdim+shx)];
end

% Vertical shifts
if shy > 0
		% if positive put this from the top side to bottom.
		tp=frame(1:shy,:);
		frame=[frame(shy+1:ydim,:) ; tp];
elseif shy < 0
		% if negative put this from the bottom to top.
		bt=frame(ydim+shy+1:ydim,:);
		frame=[bt ; frame(1:ydim+shy,:)];
end
