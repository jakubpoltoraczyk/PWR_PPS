clear all;
close all;

% Sygnał sinusoidalny

N = 10000;
A = 20;
f = 510;
fi = 0;
fp = 5000;
t = 0:1/fp:(N-1)/fp;
x = A*sin(2*pi*f*t+fi);
figure(1);
subplot(221);
plot(t,x);
title('Wykres sygnału sinusoidalnego');
xlabel('Czas [s]');
ylabel('Sinus');

% Autokorelacja
kmax = 500;
rx = xcorr(x,x,kmax);
tr = -kmax/fp:1/fp:kmax/fp;
subplot(222);
plot(tr,rx);
title('Autokorelacja sygnalu sinusoidalnego');
xlabel('Przesuniecie [s]');
ylabel('Autokorelacja');

% Histogram

nbins = 51;
subplot(223);
hist(x,nbins);
title('Histogram sygnalu sinusoidalnego');
xlabel('Wartosc probki');
ylabel('Liczebnosc probki w przedziale');