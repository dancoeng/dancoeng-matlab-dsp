%p1
clear,clc
pkg load image %remover ao utilizar em matlab
I=imread('moon.tif');
%h = fspecial('unsharp')
h=[-0.15 -0.6 -0.15; -0.6 3.9 -0.6; -0.15 -0.6 -0.15];
I2 = imfilter(I,h);
imshow(I)
title('Original Image')
figure
imshow(I2)
title('Filtered Image')