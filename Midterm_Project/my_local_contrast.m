function out = my_local_contrast(in, window_size, gauss_std )
    
    I = double(in);
    [x, y] = size(I);
    %I = imlin2(I,0,255);                                 % scaling to range 0 - 255
    hx = fspecial('gaussian',[1,window_size],gauss_std) ;% Row vector of Filter
    hy = fspecial('gaussian',[window_size,1],gauss_std) ;% Col vector of Filter
    I = padarray(I,[window_size+x-1,window_size+y-1],'symmetric','both');                           % padding with zero to avoid edge effect
    A = conv2(I,hx,'same');                            % Meaned Image
    U = conv2(A,hy,'same');
    I2 = I.*I;
    U2 = U.*U;

    B = conv2(I2,hx,'same');   % Standard Deviation Squared
    std2 = conv2(B,hy,'same')-U2;
    std2 = abs(std2);
    std = sqrt(std2);                    % Standard Deviation

    a = std < 0.01;                      % set zeros for values < 1%
    std(a) = 0;
    Image = 64*(I-U)./std + 127;         % Local Contrast Enhancemnet fomula 
    out = Image(window_size+x-1+1:x+window_size+x-1,1+window_size+x-1:y+window_size+x-1);% get rid of Zeros Area.
%   out = Image;
end