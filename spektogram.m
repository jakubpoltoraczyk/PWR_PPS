clear all;
close all;

% Przebieg czasowy

N = 10000;
fp = 5000;
t = 0:1/fp:(N-1)/fp;
x = sin(2*pi*250*t) + sin(2*pi*350*t) + sin(2*pi*750*t);
figure(1);
subplot(311);
plot(t,x);
title('Przebieg czasowy');
xlabel('Czas [s]');
ylabel('Sygnal');

% Widmo amplitudowe

Nf = 2^nextpow2(N);
N21 = Nf/2+1;
f = linspace(0,fp/2,N21);
v = fft(x,Nf);
w = abs(v);
subplot(312);
plot(f,w(1:N21));
title('Widmo amplitudowe');
xlabel('Czestotliwosc [Hz]');
ylabel('Widmo amplitudowe');

% Spektogram

subplot(313);
spectrogram(x,512,256,Nf,fp);
title('Spektogram');