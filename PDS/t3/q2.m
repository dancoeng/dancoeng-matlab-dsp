%%Questão 2
A=imread('im_original.jpg','jpg');
im_original=rgb2gray(A);
i=1;
m=1;
n=1;
b=sprintf('Image %d Filter %d M %d.tif',i,m,n);
imwrite(im_original,b)