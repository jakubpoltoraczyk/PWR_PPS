clear all;
close all;

N = 10000;
fp = 5000;
t = 0:1/fp:(N-1)/fp;
figure(1);

% Szum równomierny

x = rand(1,N);
subplot(231);
plot(t,x);
title('Wykres szumu równomiernego');
xlabel('Czas [s]');
ylabel('Szum równomierny');

% Autokorelacja szumu równomiernego

kmax = 1000;
rx = xcorr(x,x,kmax);
tr = -kmax/fp:1/fp:kmax/fp;
subplot(232);
plot(tr,rx);
title('Autokorelacja szumu równomiernego');
xlabel('Przesuniecie [s]');
ylabel('Autokorelacja');

% Histogram szumu równomiernego

nbins = 51;
subplot(233);
hist(x,nbins);
title('Histogram szumu równomiernego');
xlabel('Wartosc probki');
ylabel('Liczebnosc probki w przedziale');

% Szum gaussowski

y = randn(1,N);
subplot(234);
plot(t,y);
title('Wykres szumu gaussowskiego');
xlabel('Czas [s]');
ylabel('Szum gaussowski');

% Autokorelacja szumu gaussowskiego

kmax = 1000;
ry = xcorr(y,y,kmax);
tr = -kmax/fp:1/fp:kmax/fp;
subplot(235);
plot(tr,ry);
title('Autokorelacja szumu gaussowskiego');
xlabel('Przesuniecie [s]');
ylabel('Autokorelacja');

% Histogram szumu gaussowskiego

nbins = 51;
subplot(236);
hist(y,nbins);
title('Histogram szumu gaussowskiego');
xlabel('Wartosc probki');
ylabel('Liczebnosc probki w przedziale');