clear all;
close all;

f0 = 10;
f1 = 150;
N = 2000;
fp = 500;
t = 0:1/fp:(N-1)/fp;
tk = (N-1)/fp;
x = chirp(t,f0,tk,f1);
plot(t,x);
title('Wykres sygnału sinusoidalnego o zmiennej czestotliwosci');
xlabel('Czas [s]');
ylabel('Sinus');