%Universita' degli studi di Roma - Tor Vergata 
%Mailto:paternoster.nicolo@gmail.com

function varargout = wavelet(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wavelet_OpeningFcn, ...
                   'gui_OutputFcn',  @wavelet_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
end

function wavelet_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
load('output/tempFileName.mat');
load(toImport);


nZeri= int32((Nt*0.0015)/tmax); % Numero di campioni corrispondenti a 2.5 ms
window = repmat(0,Nt,1);
tukey=tukeywin(Nt - nZeri,0.15); %Finestra di Tukey

for i=nZeri:Nt-1
   window(i,1)=tukey(i-nZeri+1);
end

segnale = solution(:,1).*window; %Finestro il segnale


nCampioni = Nt;
Tempo_campionamento=tmax/nCampioni;
Tempo_totale=tmax;


x=[0:Tempo_campionamento:(Tempo_totale-Tempo_campionamento)];

a(1)=4;
for n=1:15
    a(n+1)=4*2^(n/3);  % Intervalli a terzi di ottava per un range totale di 3.5 ottave 
end

coefs(:,:,1) = cwt(segnale,a,'morl');%Calcola i 12 coefficienti wavelet con scala A
coefs = abs(coefs) * 1000;
pseudo_f=scal2frq(a,'morl',Tempo_campionamento);%Scala il vettore a con le pseudo frequenze

c=0;




%andamento dei coefficenti WVL nel tempo per ogni frequenza

for f=1:n+1  %da 1 a 12
[s r] = max(abs(coefs(f,:,1)));
max_coefs(f,1)= s;
tempo_max(f,1)= r;
end


% figure ;
% contour(pseudo_f./1000,x.*1000,coefs');

clc
axes(handles.countourAx2);
contour(pseudo_f./1000,x.*1000,coefs');%Plotta il contorno della matrice
axis([0.05 6 1 tmax*1000])
xlabel('Frequenze(kHz)')
ylabel('Tempo(ms)')
title('Valori dei coefficienti dell''analisi Wavelet')

% 
% figure;
% tempo_max_2 = tempo_max(1:9);
% pseudo_f_2=pseudo_f(1:9);
% fitted=fit((pseudo_f_2./1000)',tempo_max_2.*Tempo_campionamento.*1000,'power1');
% plot(pseudo_f./1000,tempo_max.*Tempo_campionamento*1000,'o',pseudo_f./1000, 17./(pseudo_f./1000),'-r');
% axis([0.05 6 1 tmax/2*1000])
% xlabel('Frequenze(kHz)')
% ylabel('Tempo(msec)')
% title('Tempi associati ai tempi relativi ai massimi coefficienti')
% grid on


axes(handles.ax1);
plot(pseudo_f./1000,tempo_max.*Tempo_campionamento*1000,'o',pseudo_f./1000, 17./(pseudo_f./1000),'-r');
axis([0.05 6 1 tmax/2*1000])
xlabel('Frequenze(kHz)')
ylabel('Tempo(msec)')
title('Tempi associati ai tempi relativi ai massimi coefficienti')
grid on

%@@@@ For Jasa --------------
%     figure
%     plot(pseudo_f./1000,tempo_max.*Tempo_campionamento*1000,'o');
%     axis([0.05 6 1 tmax/2*1000])
%     xlabel('F(kHz)')
%     ylabel('Time (ms)')
%     %title('Tempi associati ai tempi relativi ai massimi coefficienti')
%     grid on
%@@@@ For Jasa --------------

axes(handles.windowAx)
plot(surfy,window)
xlabel('t(s)');
ylabel('A');
title('Finestra utilizzata');
axis([0 tmax 0 1.5]);
grid on

axes(handles.waveletAx)
lb = -4; ub = 4; n = 1000;  
[psi,x] = morlet(lb,ub,n); 
plot(x,psi) 
axis([-4 4 -1 1.5])
title('Morlet wavelet')
grid on

  
    
    
axes(handles.stimAx)
plot(surfy,segnale);
title('Risposta alla base - Semilogy-[Finestrata]');
grid on
    
newFFT = abs(fft(segnale));
newFFT1 = newFFT(1: Nt/2);
axes(handles.fftAx); 
semilogy(fftx,newFFT1);
axis([0 6500 min(newFFT1)+0.00005 max(newFFT1)+0.009]);
title('Spettro risposta alla base');
%grid on

end


function varargout = wavelet_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;
end
