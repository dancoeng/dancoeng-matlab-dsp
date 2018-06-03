clear,clc
fs = 10000; %amostragem requisito do roteiro
f1 = 98; %frequencia escolhida (nota #Sol oitava 1)
T = 100/f1; %define o tempo de duração de 100 ciclos
t = 0:(1/fs):T;%cria vetor de 0 à T com intervalo 1/Fs
a1 =0.8; %amplitue do sinal 1
f2 = 8; %frequencia escolhida
a2 =0.2;%amplitue do sinal 2
y = a1*cos(2*pi*f1*t-pi/2)+a2*cos(2*pi*f2*t-pi/2);
sound(y,fs);
r=rand(1,10205);
Px=mean(y.^2);
Pr=mean(r.^2);
a=sqrt(Px/(10*Pr));
r2=r.*a;
Pr2=mean(r2.^2);
y2=y+r2;
[B,A]=butter(2,0.03637695);
y3=filter(B,A,y2);
%pause()
%sound(y2,fs)
%pause()
%sound(y3,fs)

%Lixo
%figure('Name','Sinal original');freqz(x);
%figure('Name','Ruido');freqz(r)
%figure('Name','Sinal ruidoso');freqz(q);
%figure('Name','Filtro');freqz(H1,H2);
%stem(t,q); xlim([0 1.0204]); ylim([-1.5 1.5]); title('sinal q[n]');
%xlabel('Tempo(s)'); ylabel('Amplitude')
%stem(t,y); xlim([0 1.0204]); ylim([-1.5 1.5]); title('sinal q[n]');
%xlabel('Tempo(s)'); ylabel('Amplitude')
%stem(t,q); xlim([0 0.08]); ylim([-1.5 1.5]); title('sinal q[n]');
%xlabel('Tempo(s)'); ylabel('Amplitude')
%stem(t,y); xlim([0 0.08]); ylim([-1.5 1.5]); title('sinal q[n]');
%xlabel('Tempo(s)'); ylabel('Amplitude')
%stem(abs(X));grid;xlim([0 500])
%[n,d]=freqz(x,10205,10205);
%stem(t*Fs/2,abs(n))