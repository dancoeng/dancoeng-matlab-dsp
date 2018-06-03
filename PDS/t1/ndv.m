%** System Spectra **%
  clear;                          % clear matlab memory
  R = 100; L = 1e-3; C = 100e-9;  % define circuit parameters
  w = 0:2:250000;           % frequency values for spectra
  H = (R/L)*j*w./((j*w).^2 + (R/L)*j*w + 1/(L*C)); % system TF
  figure(1); clf;                 % open and clear figure 1
  subplot(2,1,1); plot(w,abs(H)); % plot magnitude spectrum
  xlabel('\omega rad/sec'); ylabel('|H(\omega)|');
  title('RLC Circuit Gain/Magnitude Spectra');
  subplot(2,1,2); plot(w,angle(H)*180/pi); % plot phase spectrum
  xlabel('\omega rad/sec'); ylabel('\angle {H(\omega) deg}');
  title('RLC Circuit Phase/Phase Spectra');