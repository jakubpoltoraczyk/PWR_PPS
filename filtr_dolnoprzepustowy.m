clear all
close all;

% Przebieg czasowy sygnalu (przed filtracja)

N = 12000;
fp = 40000;
t = 0:1/fp:(N-1)/fp;
x = chirp(t,500,(N-1)/fp,4500);
figure(1);
subplot(321);
plot(t,x);
title('Sygnal przed filtracja');
xlabel('Czas [s]');
ylabel('Sygnal');

% Widmo amplitudowe sygnalu (przed filtracji)

Nf = 2^nextpow2(N);
N21 = Nf/2+1;
f = linspace(0,fp/2,N21);
v = fft(x,Nf);
w = abs(v);
subplot(322);
plot(f,w(1:N21));
title('Widmo amplitudowe sygnalu przed filtracja');
xlabel('Czestotliwosc [Hz]');
ylabel('Widmo amplitudowe');

% Odpowiedz impulsowa filtru

M = 201;
fg = 2500;
fgu = fg/(fp/2);
h = fir1(M-1,fgu);
th = 0:1/fp:(M-1)/fp;
subplot(323);
plot(th,h);
title('Odpowiedz impulsowa filtru');
xlabel('Czas [s]');
ylabel('Odpowiedz impulsowa');

% Modul transmitancji filtru

Nfh = 2^nextpow2(M);
N21h = Nfh/2+1;
fh = linspace(0,fp/2,N21h);
vh = fft(h,Nfh);
wh = abs(vh);
subplot(324);
plot(fh,wh(1:N21h));
title('Modul transmitancji filtru');
xlabel('Czestotliwosc [Hz]');
ylabel('Modul transmitancji');

% Przebieg czasowy sygnalu (po filtracji)

y = filter(h,1,x);
subplot(325);
plot(t,y);
title('Sygnal po filtracji');
xlabel('Czas [s]');
ylabel('Sygnal');

% Widmo amplitudowe sygnalu (po filtracji)

vy = fft(y,Nf);
wy = abs(vy);
subplot(326);
plot(f,wy(1:N21));
title('Widmo amplitudowe sygnalu po filtracji');
xlabel('Czestotliwosc [Hz]');
ylabel('Widmo amplitudowe');