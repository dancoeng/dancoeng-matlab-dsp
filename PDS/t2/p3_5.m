clf;
num = [2 5 9 5 3];
den = [5 45 2 1 1];
[z,p,k] = tf2zp(num,den);
disp(z)
disp(p)
sos=zp2sos(z,p,k);
zplane(z,p);