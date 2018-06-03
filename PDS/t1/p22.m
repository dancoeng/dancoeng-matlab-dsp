%%Roteiro 1 -- Parte 2 -- Danilo C Celestino
clear,clc
[x,Fs]=audioread('net2.wav');
%[a,b]=size(x);
sound(x,Fs);
r=randn(size(x));
Px=mean(x.^2);
Pr=mean(r.^2);
a=sqrt(Px/(100*Pr));
r2=r.*a;
Pr2=mean(r2.^2);
y=x+r2;
[B,A]=ellip(1,5,40,0.5167236);
%[B,A]=butter(50,0.5167236);
z=filter(B,A,y);
%audiowrite('netruido.wav',y,16000);
%pause(3)
%disp('tecle qualquer tecla para ouvir com ruido')
%pause()
%sound(y,Fs);
%pause(3)
%disp('tecle qualquer tecla para ouvir filtrado')
%pause()
%sound(z,Fs);
t=(-1.5+1/Fs):1/Fs:1.5; % gera um vetor de -1.4999375 à 1.5 segundos 
t=t(:); %torna um vetor coluna para coincidir com os demais sinais
Y3=fft(z);%faz a transf. de Fourrier do meu sinal
%incompleto daqui pra baixo
plot(t,abs(Y3))%plota meu gráfico de módulo entre -1.5 e 1.5 segundos
plot(angle(Y3))%plota meu gráfico de fase
freqz(B,A)%plota o gráfico de módulo e fase do filtro utilizado

%figure('Name','Sinal ruidoso e filtrado');subplot(211);plot(q);subplot(212);plot(y)
%figure('Name','Sinal original');freqz(x);
%figure('Name','Ruido');freqz(r)
%figure('Name','Sinal ruidoso');freqz(q);
%figure('Name','Filtro');freqz(H1,H2);
%figure('Name','Sinal filtrado');freqz(y);