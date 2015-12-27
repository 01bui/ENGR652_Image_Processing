% Divide the images into separate training and testing image sets
% Use the first image (1.pgm) for each person for testing  
testingImageSet = deck(:,:,1:10:end); 
% Display 40 faces of people for testing
image_subfigure(testingImageSet);
% Use the last 9 images (2.pgm - 10.pgm) of each person for training
trainingImageSet = deck; 
trainingImageSet(:,:,1:10:end) = [];
% Convert to double for later computation
testingImageSet = double(testingImageSet);
trainingImageSet = double(trainingImageSet);
% The average face in face space
[imageWidth, imageHeight, facesNum] = size(trainingImageSet);
N = imageHeight*imageWidth; 
vecFace = zeros(N,facesNum);
sum = zeros(N,1);
for n = 1:facesNum
    a = trainingImageSet(:,:,n);
    vecFace(:,n) = a(:);
    sum = sum + a(:);
end
avgVecFace = sum/facesNum; 
sum = reshape(avgVecFace,imageWidth,imageHeight);
figure
imagesc(sum);colormap(gray(256));title('Average face');axis image;
% Compute each face's difference from the average
A = zeros(N,facesNum);
for n = 1:facesNum
    A(:,n) =  vecFace(:,n) - avgVecFace;
end
% Compute a covariance matrix (C) for dataset 
C = A'*A;
% PCA
[eigVec, eigVal] = eig(C);
V = A * eigVec; 
eigenFace = [];
eighenFace = [];
for n = 1:facesNum
    b = V(:,n);
    eigenFace{n} = reshape(b,imageWidth,imageHeight);
end
m = diag(eigVal);
[ma,mb] = sort(m,'descend');
for n = 1:20
    eighenFace{n} = eigenFace{mb(n)};
    eigenFaceVec(:,n) = eighenFace{n}(:);
end
eigenFaces20 = [eighenFace{1} eighenFace{2} eighenFace{3} eighenFace{4} eighenFace{5} ...
                eighenFace{6} eighenFace{7} eighenFace{8} eighenFace{9} eighenFace{10}; ...
                eighenFace{11} eighenFace{12} eighenFace{13} eighenFace{14} eighenFace{15} ...
                eighenFace{16} eighenFace{17} eighenFace{18} eighenFace{19} eighenFace{20}];
figure
imagesc(eigenFaces20)
colormap(gray)
axis image;
% Weight of top 20 images
n = 20;
for i = 1:facesNum 
    for k = 1:n 
        w(k,i) = dot(A(:,i),eigenFaceVec(:,k));
    end
end
newFace = testingImageSet(:,:,1);
[~,~,m] = size(testingImageSet); 
for i = 1:m
    newFace= testingImageSet(:,:,i);
    fA = newFace(:)-avgVecFace;
    for k=1:n
        wp(k,i) = dot(fA,eigenFaceVec(:,k));
    end
end
dist = distance_mx(wp, w);
for i = 1:m
    newFace = testingImageSet(:,:,i);
    [mi,idx] = min(dist(i,:));
    recognizedFace = trainingImageSet(:,:,idx);
    figure
    subplot(121); 
    imagesc(newFace), colormap(gray), axis image, title('Face to test');
    subplot(122); 
    imagesc(recognizedFace), colormap(gray), axis image, title('Recognized face');
end