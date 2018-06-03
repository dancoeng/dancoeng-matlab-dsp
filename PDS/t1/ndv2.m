n=0:999;
x=5*cos((0.13*pi*n)+(pi/13));
x1=fftshift(fft(x))/L;
dw=2*pi/L;
w=-pi:dw:pi-dw;
   mag=abs(x1);
   stem(w,mag);
   title('Magnitude Plot');
   
 %--------------------
X=fft(x);
X=fftshift(X);
T=-Fs/2+1/Fs:Fs/2;
stem(T,abs(X))