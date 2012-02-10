%Parametri
f1=1200;     
fratio=1.5;
f2=10000;
fdp=2*f1 -f2;
campioni=2048;
tempo = 0.05;
dt = tempo / campioni;
fmax = 1/dt ;
df = fmax / campioni;
x=linspace(0,tempo,campioni);

%Segnale originale
timeSignal = 3*sin(2*pi*f1*x) + sin(2*pi*f2*x) + 0.001*(sin(2*pi*fdp*x));
timeFFT = fft(timeSignal);
timeFFT = timeFFT(1:campioni/2);
timeMagFFT = abs(timeFFT);
timePhaseFFT = angle(timeFFT);

fftx = (1:campioni/2)*(1/tempo);

%Plot Segnale originale
subplot(2,3,1);
plot(x,timeSignal);
%axis([0 0.005 -inf +inf]);
title('Segnale originale')

subplot(2,3,2);
plot(fftx,timeMagFFT);
grid on;
%axis([0 f2+300 0 10]);
title('Spettro Segnale originale')

subplot(2,3,3);
plot(fftx,timePhaseFFT);
title('Fase Segnale originale')


%%%%%%%%%%%%%%%%%%%%%
%figure
b1 =[0.0181 0.0543 0.0543 0.0181];
a1 =[1.0000 -1.7600 1.1829 -0.2781];
b2 =[0.0115 0.0344 0.0344 0.0115];
a2 =[1.0000 -2.1378 1.7693 -0.5398];
b3 =[0.0626 -0.0059 -0.0059 0.0626];
a3 =[1.0000 -2.1279 1.7848 -0.5434];
% P1=filt(b1,a1);
% P2=filt(b2,a2);
% P3=filt(b3,a3);
% w=linspace(0,pi,500);
% H1=freqresp(P1,w);
%subplot(3,1,1);
%plot(w,abs(H1(:)));
% ylabel('Ampiezza');
% title('H1 ');
% axis([0 pi 0 1]);
% H2=freqresp(P2,w);
%subplot(3,1,2);
%plot(w,abs(H2(:)));
% ylabel('Ampiezza');
% title('H2 ');
% axis([0 pi 0 1]);
% H3=freqresp(P3,w);
%subplot(3,1,3);
%plot(w,abs(H3(:)));
% xlabel('Pulsazione discreta [rad]');
% ylabel('Ampiezza');
% title('H3 ');


filtrato=filter(b3,a3,timeSignal);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
timeFFTf = fft(filtrato);
timeFFTf = timeFFT(1:campioni/2);
timeMagFFTf = abs(timeFFTf);
timePhaseFFTf = angle(timeFFTf);


subplot(2,3,4);
plot(x,filtrato);
%axis([0 0.005 -inf +inf]);
title('Segnale Filtrato')

subplot(2,3,5);
plot(fftx,timeMagFFTf);
grid on;
%axis([0 f2+300 0 10]);
title('Spettro Segnale Filtrato')

subplot(2,3,6);
plot(fftx,timePhaseFFTf);
title('Fase Segnale Filtrato')