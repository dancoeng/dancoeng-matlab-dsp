clear,clc
pkg load image %Retire se rodar no Matlab
im_original=imread('im_original.jpg','jpg');
im_original=rgb2gray(im_original);
im_ruido=imnoise(im_original,'salt & pepper',0.06);
h=fspecial('average',3);
Filtered=filter2(h,im_ruido);