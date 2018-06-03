% Compute the frequency samples of the DTFT
w = 0:pi/1023:pi;
num =[0.15 0 -0.15];
den =[1 -0.5 0.7];
h = freqz(num, den, w);
% Compute and plot the DTFT
figure
subplot(2,1,1)
plot(w/pi,abs(h));grid
title('Magnitude Spectrum |H(e^{j\omega})|')
xlabel('\omega /\pi');
ylabel('Amplitude');
subplot(2,1,2)
plot(w/pi,angle(h));grid
title('Phase Spectrum arg[H(e^{j\omega})]')
xlabel('\omega /\pi');
ylabel('Phase in radians');