clear,clc
[x,Fs]=audioread('net2.wav');
t=1/Fs:1/Fs:3;
r=randn(size(x))-0.5;%ruído de +/- 0.5
Px=mean(x.^2);%potencia do sinal
Pr=mean(r.^2);%Potência do ruído
temp=sqrt(Px/(100*Pr));
r=r*temp;%ruido quantizado
q=x+r; %sinal com ruído
[H1,H2]=butter(40,0.5167236); %filtro Butterworth passa-baixo
y=filter(H1,H2,q);%sinal filtrado
audiowrite('netruido.wav',y,16000); %grava o audio com ruído
T=-24000+1:24000;
X=fft(x);X=fftshift(X);
R=fft(r);R=fftshift(R);
Q=fft(q);Q=fftshift(Q);
Y=fft(y);Y=fftshift(Y);
[h1,~]=freqz(H1,H2,24000); % recolhe módulo e fase do filtro
h2=flip(h1); %espelha o vetor para ser usado nas frequencias negativas
H=[h2;h1]; %junta os 2 vetores anteriores em um só de -24kHz a 24kHz

%plota gráficos
figure('Name','Sinal ruidoso e filtrado');
subplot(211);stem(t,q);title('Sinal ruidoso');ylabel('Amplitude');xlabel('(n)');
subplot(212);stem(t,y);title('Sinal filtrado');ylabel('Amplitude');xlabel('(n)');
figure('Name','Sinal original');subplot(211);
stem(T,20*log10(abs(X)));title('Módulo');xlabel('kHz');ylabel('Magnitude(dB)');
subplot(212);stem(T,angle(X)/2);title('Fase');xlabel('kHz');ylabel('rad');
figure('Name','Sinal ruido');subplot(211);
stem(T,20*log10(abs(R)));title('Módulo');xlabel('kHz');ylabel('Magnitude(dB)');
subplot(212);stem(T,angle(R)/2);title('Fase');xlabel('kHz');ylabel('rad');
figure('Name','Sinal ruidoso');subplot(211);
stem(T,20*log10(abs(Q)));title('Módulo');xlabel('kHz');ylabel('Magnitude(dB)');
subplot(212);stem(T,angle(Q)/2);title('Fase');xlabel('kHz');ylabel('rad');
figure('Name','Filtro');subplot(211);
stem(T,abs(H));title('Módulo');xlabel('kHz');ylabel('Magnitude');
subplot(212);stem(T,angle(H)/2);title('Fase');xlabel('kHz');ylabel('rad');
figure('Name','Sinal filtrado');subplot(211);
stem(T,20*log10(abs(Y)));title('Módulo');xlabel('kHz');ylabel('Magnitude(dB)');
subplot(212);stem(T,angle(Y)/2);title('Fase');xlabel('kHz');ylabel('rad');
figure('Name','Sinal filtrado (freq. cont.');subplot(211);
plot(T,20*log10(abs(X)));title('Módulo');xlabel('kHz');ylabel('Magnitude(dB)');
subplot(212);plot(T,angle(X)/2);title('Fase');xlabel('kHz');ylabel('rad');

%Som
sound(x,Fs);
pause(3)
disp('tecle qualquer tecla para ouvir com ruido')
pause()
sound(q,Fs);
pause(3)
disp('tecle qualquer tecla para ouvir filtrado')
pause()
sound(y,Fs);