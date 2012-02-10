function difference = sot(fname1,fname2,showGraphs);
%esegue la differenza tra il segnale alla base dei due file 
load(strcat(fname1));
x=surfy;
s1 = solution(:,1);

st1 = solution;
load(strcat(fname2));
s2 = solution(:,1);
st2 = solution;
difference = st2-st1 ;
differenceBase = s2-s1 ;

if (showGraphs ==1)
figure
subplot(3,2,1);
plot(x,s1) ;
axis([0 0.05 -inf +inf])
title('s1');

subplot(3,2,2);
spettros1 = fft(s1);
spettros1 = spettros1(1:Nt/2);
semilogy(fftx,abs(spettros1));
%plot(fftx,abs(spettros1));
axis([0 6000 0 +inf]);
title('Spettro s1');


subplot(3,2,3);
plot(x,s2) ;
axis([0 0.05 -inf +inf])
title('s2');
%Jasa ------------------------------
%figure
%plot(x,s2) ;
%axis([0 0.05 -inf +inf])
%title('s2');
%Jasa--------------------------------


subplot(3,2,4);
spettros2 = fft(s2);
spettros2 = spettros2(1:Nt/2);
semilogy(fftx,abs(spettros2));
%plot(fftx,abs(spettros2));
axis([0 6000 0 max(abs(spettros1))]);
title('Spettro s2');


subplot(3,2,5);
plot(x,differenceBase) ;
axis([0 0.05 -inf +inf])
title('diff');
%Jasa-----------
%figure
%plot(x,differenceBase) ;
%axis([0 0.05 -inf +inf])
%title('diff');
%Jasa-----------
subplot(3,2,6);
spettrodiff = fft(differenceBase);
spettrodiff = spettrodiff(1:Nt/2);
semilogy(fftx,abs(spettrodiff));
%plot(fftx,abs(spettrodiff));
axis([0 6000 0 max(abs(spettros1))]);
title('Spettro diff');

%Grafici che mostrano l'andamento della funzione che attenua la roughness
% figure
% subplot(2,1,1);
% pnonlin = nonlin(1:N)*10^7;
% freqVector = getFreq(surfx/1000);
% for m=1:N
%     freqX(m)=freqVector(N+1-m);    
% end
% plot(freqVector,pnonlin)
% set(gca,'XTick',0:2000:20000)
% xlabel('f(Hz)');
% grid on
% axis([0 20000 0 max(pnonlin)+10^7])
% 
% load(strcat(fname1));
% pnonlin = nonlin(1:N)*10^7;
% subplot(2,1,2);
% plot(freqVector,pnonlin)
% set(gca,'XTick',0:2000:20000)
% grid on
% xlabel('f(Hz)');
%  axis([0 20000 0 max(pnonlin)+10^7])
end
end