load wva
test = wva(:,:,1);
hist(test(:),100); figure; 
image(test); colormap(gray(256)); axis image

test2=myhisteq(test,256);
figure; hist(test2(:),100); figure; 
image(test2); colormap(gray(256)); axis image