clear,clc
Fs=10000; %freq. de amostragem
w1=100; %freq. 1
t=1/Fs:(1/Fs):(100/w1);% duração de 100 ciclos do sinal de maior freq.
A1=0.8;
w2=12.5; %1/8 de w1
A2=0.2;
x=A1*cos(2*pi*w1*t-(pi/2))+A2*cos(2*pi*w2*t-(pi/2));%sinal original
r0=randn(size(x));%ruído
r0=r0-0.5; %torna o ruído de -0.5 a 0.5
Px=mean(x.^2);%potencia do sinal
Pr=mean(r0.^2);%Potência do ruído
r=r0*sqrt(Px/(10*Pr));%ruido quantizado
q=x+r; %sinal com ruído
[H1,H2]=butter(3,0.03674316); %filtro Butterworth passa-baixo
y=filter(H1,H2,q);%sinal filtrado
T=-Fs/2+1/Fs:Fs/2;
X=fft(x);X=fftshift(X);
R=fft(r);R=fftshift(R);
Q=fft(q);Q=fftshift(Q);
Y=fft(y);Y=fftshift(Y);
[h1,~]=freqz(H1,H2,5000); % recolhe módulo e fase do filtro
h2=flip(h1); %espelha o vetor para ser usado nas frequencias negativas
H=[h2;h1]; %junta os 2 vetores anteriores em um só de -24kHz a 24kHz

%erro
e=length(x);
for d=18:length(x)
e(d)=x(d-17)-y(d);
end
e(1)=0;

%plota gráficos
figure('Name','Sinal ruidoso e filtrado');
subplot(211);stem(q);title('Sinal ruidoso');ylabel('Amplitude');xlabel('(n)');
subplot(212);stem(y);title('Sinal filtrado');ylabel('Amplitude');xlabel('(n)');ylim([-1.5 1.5]);
figure('Name','Sinal original');subplot(211);
stem(T,20*log10(abs(X)));title('Módulo');xlabel('Hz');ylabel('Magnitude(dB)');
subplot(212);stem(T,angle(X)/2);title('Fase');xlabel('Hz');ylabel('rad');
figure('Name','Sinal ruido');subplot(211);
stem(T,20*log10(abs(R)));title('Módulo');xlabel('Hz');ylabel('Magnitude(dB)');
subplot(212);stem(T,angle(R)/2);title('Fase');xlabel('Hz');ylabel('rad');
figure('Name','Sinal ruidoso');subplot(211);
stem(T,20*log10(abs(Q)));title('Módulo');xlabel('Hz');ylabel('Magnitude(dB)');
subplot(212);stem(T,angle(Q)/2);title('Fase');xlabel('Hz');ylabel('rad');
figure('Name','Filtro');subplot(211);
stem(T,(abs(H)));title('Módulo');xlabel('Hz');ylabel('Magnitude');
subplot(212);stem(T,angle(X)/2);title('Fase');xlabel('Hz');ylabel('rad');
figure('Name','Sinal filtrado');subplot(211);
stem(T,20*log10(abs(Y)));title('Módulo');xlabel('Hz');ylabel('Magnitude(dB)');
subplot(212);stem(T,angle(Y)/2);title('Fase');xlabel('Hz');ylabel('rad');
figure('Name','Erro');
plot(t,e);title('Erro');xlabel('tempo(s)');ylabel('Amplitude');
figure('Name','Sinal filtrado (freq. continua)');subplot(211);
plot(T,20*log10(abs(Y)));title('Módulo');xlabel('Hz');ylabel('Magnitude(dB)');
subplot(212);plot(T,angle(Y)/2);title('Fase');xlabel('Hz');ylabel('rad');
%toca os sons
sound(x,Fs);pause(100/w1);
disp('qualquer tecla para continuar')
pause();sound(q,Fs);pause(100/w1);
disp('qualquer tecla para continuar')
pause();sound(y,Fs);