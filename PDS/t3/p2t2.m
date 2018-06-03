clear,clc
pkg load image %Retire se rodar no Matlab
A=imread('im_original.jpg','jpg');
im_original=rgb2gray(A);
im_original1=imnoise(im_original,'salt & pepper',0.06);
%Averanges

M=[3 5 7];
for m=1:3 %refere-se a variação de M
  for n=1:2 %refere-se a filtro 1 ou 2
    if n==1 
      Averange=fspecial('averange',M(m));
      Filtered=filter2(Averange,im_original1);
    else
      Filtered=medfilt2(im_original1,[M(m) M(m)]);
    end
    Error=im_original-Filtered;
    MSE=mean(Error(:).^2);
    PSNR1(n,m)=10*log10(255^2/MSE);
  end
end
a3=fspecial('average',3);
i1a3=filter2(a3,im_original1);
ei1a3=im_original-i1a3;
MSE113=mean(ei1a3(:).^2);
PSNR1(1,1)=10*log10(255^2/MSE113);

i1m3=medfilt2(im_original1,[3 3]);
ei1m3=im_original-i1m3;
MSE123=mean(ei1m3(:).^2);
PSNR1(2,1)=10*log10(255^2/MSE115);

a5=fspecial('average',5);
i1a5=filter2(a5,im_original1);
ei1a5=im_original-i1a5;
MSE115=mean(ei1a5(:).^2);
PSNR1(3,1)=10*log10(255^2/MSE117);

i1m5=medfilt2(im_original1,[5 5]);
ei1m5=im_original-i1m5;
MSE125=mean(ei1m5(:).^2);
PSNR1(1,2)=10*log10(255^2/MSE123);

a7=fspecial('average',7);
i1a7=filter2(a7,im_original1);
ei1a7=im_original-i1a7;
MSE117=mean(ei1a7(:).^2);
PSNR1(2,2)=10*log10(255^2/MSE125);

i1m7=medfilt2(im_original1,[7 7]);
ei1m7=im_original-i1m7;
MSE127=mean(ei1m7(:).^2);
PSNR1(3,2)=10*log10(255^2/MSE127);
