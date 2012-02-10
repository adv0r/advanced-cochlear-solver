%Universita' degli studi di Roma - Tor Vergata 
%Mailto:paternoster.nicolo@gmail.com

function varargout = wavelet2(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wavelet2_OpeningFcn, ...
                   'gui_OutputFcn',  @wavelet2_OutputFcn, ...
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



% --- Executes just before wavelet2 is made visible.
function wavelet2_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

load('output/tempFileName.mat');
load(toImport);


nZeri= int32((Nt*0.0015)/tmax); % Numero di campioni corrispondenti a 2.5 ms
window = repmat(0,Nt,1);
tukey=tukeywin(Nt - nZeri,0.20); %Finestra di Tukey

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
    a(n+1)=4*2^(n/3);  % Intervalli a terzi di ottava per un range totale di 4 ottave 
end

coefs(:,:,1) = cwt(segnale(:,1),a,'morl');%Calcola i 16 coefficienti wavelet con scala A
coefs = abs(coefs) * 1000;
pseudo_f=scal2frq(a,'morl',Tempo_campionamento);%Scala il vettore a con le pseudo frequenze
c=0;

axes(handles.multiCoeffAx);
for i=1:16
subplot(4,4,i)
plot(x*1000,abs(coefs(i,:)))
title(pseudo_f(i));
axis([0 x(1024)*1000 -inf +inf])
end

guidata(hObject, handles);


function varargout = wavelet2_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
