clear all;
close all;

% Sygnal sinusoidalny

N = 1024;
fp = 2048;
t = 0:1/fp:(N-1)/fp;
x = 2*sin(2*pi*250*t) + 3*sin(2*pi*350*t);
figure(1);
subplot(121);
plot(t,x);
title('Sygnal sinusoidalny');
xlabel('Czas [s]');
ylabel('Sygnal');

% Widmo amplitudowe

Nf = 1024;
N21 = Nf/2+1;
f = linspace(0,fp/2,N21);
v = fft(x,Nf);
w = abs(v);
subplot(122);
plot(f,w(1:N21));
title('Widmo amplitudowe sygnalu sinusoidalnego');
xlabel('Czestotliwosc [Hz]');
ylabel('Widmo amplitudowe');