clear all;
close all;

N = 10000;
fp = 5000;
t = 0:1/fp:(N-1)/fp;
x = 2*sin(2*pi*50*t) + 3*sin(2*pi*150*t) + 6*sin(2*pi*550*t);
figure(1);
subplot(221);
plot(t,x);
title('Sygnal przed decymacja');
xlabel('Czas [s]');
ylabel('Sygnal');

Nf = 2^nextpow2(N);
N21 = Nf/2+1;
f = linspace(0,fp/2,N21);
v = fft(x,Nf);
w = abs(v);
subplot(222);
plot(f,w(1:N21));
title('Widmo amplitudowe sygnalu przed decymacja');
xlabel('Czestotliwosc [Hz]');
ylabel('Widmo amplitudowe');

dr = 4;
Ny = floor(N/dr);
fpy = fp/dr;
for i=1:Ny
    y(i) = x((i-1)*dr+1); 
end
ty = 0:1/fpy:(Ny-1)/fpy;
subplot(223);
plot(ty,y);
title('Sygnal pod decymacji');
xlabel('Czas [s]');
ylabel('Sygnal');

Nfy = 2^nextpow2(Ny);
N21y = Nfy/2+1;
fy = linspace(0,fpy/2,N21y);
vy = fft(y,Nfy);
wy = abs(vy);
subplot(224);
plot(fy,wy(1:N21y));
title('Widmo amplitudowe sygnalu po decymacji');
xlabel('Czestotliwosc [Hz]');
ylabel('Widmo amplitudowe');