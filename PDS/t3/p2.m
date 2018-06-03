%%Proj.3/Quest.2/Danilo C./201207140064
clear,clc
pkg load image %Retire se rodar no Matlab
im_original=imread('coins.jpg');
imshow(im_original) %exibe a imagem original
[~,x,z]=size(im_original); %define quantas colunas tem a matriz da imagem usada
if z!=1 im_original=rgb2gray(im_original); else end %se rgb converte para gray
im_ruido(:,0+1:x)=imnoise(im_original,'salt & pepper',0.06);
im_ruido(:,x+1:2*x)=imnoise(im_original,'salt & pepper',0.005);
im_ruido(:,(2*x)+1:3*x)=imnoise(im_original,'gaussian',0,0.001);
im_ruido(:,(3*x)+1:4*x)=imnoise(im_original,'gaussian',0,0.03);
figure; imshow(im_ruido(:,0+1:x)) %exibe a imagem com ruido s&p .06
figure; imshow(im_ruido(:,x+1:2*x)) %exibe a imagem com ruido s&p .005
figure; imshow(im_ruido(:,(2*x)+1:3*x)) %exibe a imagem com ruido gausian .001
figure; imshow(im_ruido(:,(3*x)+1:4*x)) %exibe a imagem com ruido gausian .03
M=[3 5 7];
for i=0:3 %refere-se a variação das Imagens
  for m=1:3 %refere-se a variação de M
    for n=1:2 %refere-se a filtro 1 ou 2
      if n==1
        %time1=time;
        Average=fspecial('average',M(m));
        Filtered=filter2(Average,im_ruido(:,(i*x)+1:((i+1)*x)));
        %time2=time;
        %time3=time2-time1;
      else
        %time1=time;
        Filtered=medfilt2(im_ruido(:,(i*x)+1:((i+1)*x)),[M(m) M(m)]);
        %time2=time;
        %time3=time2-time1;
      end
      Error=im_original-Filtered;
      MSE=mean(Error(:).^2);
      PSNR(m+(i*3),n)=10*log10(255^2/MSE);
      %as duas linhas abaixo salvam o resultado de cada filtragem
      %b=sprintf('Im%dFilt%dM%d.tif',i,m,n); %define o nome da figura
      %Filtered=uint8(Filtered); imwrite(Filtered,b) %salva a figura
    end
  end
end
PSNR=[[1 3;1 5;1 7;2 3;2 5;2 7;3 3;3 5;3 7;4 3;4 5;4 7] PSNR];
disp('    Imagem       M      Media    Mediana')
disp(PSNR)