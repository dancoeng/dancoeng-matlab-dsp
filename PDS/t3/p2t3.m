%%P2
clear,clc
pkg load image %Retire se rodar no Matlab
A=imread('coins.jpg','jpg');
im_original=rgb2gray(A);
im_original1=imnoise(im_original,'salt & pepper',0.06);
im_original2=imnoise(im_original,'salt & pepper',0.005);
im_original3=imnoise(im_original,'gaussian',0,0.001);
im_original4=imnoise(im_original,'gaussian',0,0.03);
%Averanges
a3=fspecial('average',3);
a5=fspecial('average',5);
a7=fspecial('average',7);
%Filters averages
%Noisy  Image 1
i1a3=filter2(a3,im_original1);
i1a5=filter2(a5,im_original1);
i1a7=filter2(a7,im_original1);
%Noisy  Image 2
i2a3=filter2(a3,im_original2);
i2a5=filter2(a5,im_original2);
i2a7=filter2(a7,im_original2);
%Noisy  Image 3
i3a3=filter2(a3,im_original3);
i3a5=filter2(a5,im_original3);
i3a7=filter2(a7,im_original3);
%Noisy  Image 4
i4a3=filter2(a3,im_original4);
i4a5=filter2(a5,im_original4);
i4a7=filter2(a7,im_original4);
%Filters median
%Noisy  Image 1
i1m3=medfilt2(im_original1,[3 3]);
i1m5=medfilt2(im_original1,[5 5]);
i1m7=medfilt2(im_original1,[7 7]);
%Noisy Image 2
i2m3=medfilt2(im_original2,[3 3]);
i2m5=medfilt2(im_original2,[5 5]);
i2m7=medfilt2(im_original2,[7 7]);
%Noisy Image 3
i3m3=medfilt2(im_original3,[3 3]);
i3m5=medfilt2(im_original3,[5 5]);
i3m7=medfilt2(im_original3,[7 7]);
%Noisy Image 4
i4m3=medfilt2(im_original4,[3 3]);
i4m5=medfilt2(im_original4,[5 5]);
i4m7=medfilt2(im_original4,[7 7]);
%Erros
ei1a3=im_original-i1a3;
ei1a5=im_original-i1a5;
ei1a7=im_original-i1a7;

ei2a3=im_original-i2a3;
ei2a5=im_original-i2a5;
ei2a7=im_original-i2a7;

ei3a3=im_original-i3a3;
ei3a5=im_original-i3a5;
ei3a7=im_original-i3a7;

ei4a3=im_original-i4a3;
ei4a5=im_original-i4a5;
ei4a7=im_original-i4a7;

ei1m3=im_original-i1m3;
ei1m5=im_original-i1m5;
ei1m7=im_original-i1m7;

ei2m3=im_original-i2m3;
ei2m5=im_original-i2m5;
ei2m7=im_original-i2m7;

ei3m3=im_original-i3m3;
ei3m5=im_original-i3m5;
ei3m7=im_original-i3m7;

ei4m3=im_original-i4m3;
ei4m5=im_original-i4m5;
ei4m7=im_original-i4m7;

MSE113=mean(ei1a3(:).^2);
MSE115=mean(ei1a5(:).^2);
MSE117=mean(ei1a7(:).^2);
MSE123=mean(ei1m3(:).^2);
MSE125=mean(ei1m5(:).^2);
MSE127=mean(ei1m7(:).^2);

MSE213=mean(ei2a3(:).^2);
MSE215=mean(ei2a5(:).^2);
MSE217=mean(ei2a7(:).^2);
MSE223=mean(ei2m3(:).^2);
MSE225=mean(ei2m5(:).^2);
MSE227=mean(ei2m7(:).^2);

MSE313=mean(ei3a3(:).^2);
MSE315=mean(ei3a5(:).^2);
MSE317=mean(ei3a7(:).^2);
MSE323=mean(ei3m3(:).^2);
MSE325=mean(ei3m5(:).^2);
MSE327=mean(ei3m7(:).^2);

MSE413=mean(ei4a3(:).^2);
MSE415=mean(ei4a5(:).^2);
MSE417=mean(ei4a7(:).^2);
MSE423=mean(ei4m3(:).^2);
MSE425=mean(ei4m5(:).^2);
MSE427=mean(ei4m7(:).^2);

PSNR1(1,1)=10*log10(255^2/MSE113);
PSNR1(2,1)=10*log10(255^2/MSE115);
PSNR1(3,1)=10*log10(255^2/MSE117);
PSNR1(1,2)=10*log10(255^2/MSE123);
PSNR1(2,2)=10*log10(255^2/MSE125);
PSNR1(3,2)=10*log10(255^2/MSE127);
disp(PSNR1)

PSNR2(1,1)=10*log10(255^2/MSE213);
PSNR2(2,1)=10*log10(255^2/MSE215);
PSNR2(3,1)=10*log10(255^2/MSE217);
PSNR2(1,2)=10*log10(255^2/MSE223);
PSNR2(2,2)=10*log10(255^2/MSE225);
PSNR2(3,2)=10*log10(255^2/MSE227);
disp(PSNR2)

PSNR3(1,1)=10*log10(255^2/MSE313);
PSNR3(2,1)=10*log10(255^2/MSE315);
PSNR3(3,1)=10*log10(255^2/MSE317);
PSNR3(1,2)=10*log10(255^2/MSE323);
PSNR3(2,2)=10*log10(255^2/MSE325);
PSNR3(3,2)=10*log10(255^2/MSE327);
disp(PSNR3)

PSNR4(1,1)=10*log10(255^2/MSE413);
PSNR4(2,1)=10*log10(255^2/MSE415);
PSNR4(3,1)=10*log10(255^2/MSE417);
PSNR4(1,2)=10*log10(255^2/MSE423);
PSNR4(2,2)=10*log10(255^2/MSE425);
PSNR4(3,2)=10*log10(255^2/MSE427);
disp(PSNR4)
