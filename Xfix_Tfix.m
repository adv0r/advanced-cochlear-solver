%Universita' degli studi di Roma - Tor Vergata 
%Mailto:paternoster.nicolo@gmail.com

function varargout = Xfix_Tfix(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Xfix_Tfix_OpeningFcn, ...
                   'gui_OutputFcn',  @Xfix_Tfix_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before Xfix_Tfix is made visible.
function Xfix_Tfix_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Xfix_Tfix (see VARARGIN)

% Choose default command line output for Xfix_Tfix
handles.output = hObject;
load('output/tempFileName.mat');
load(toImport);
newN = N ;

set(handles.tEdit,'String',num2str(get(handles.tSlider,'Value')*0.01953125));
axes(handles.tAx)
plot(surfx,solution(500,:));
xlabel('x[mm]');
ylabel('A');
grid on

axes(handles.xAx)
plot(surfy,solution(:,int32(newN/2)));
xlabel('t[s]');
ylabel('A');
grid on

axes(handles.xFFT)
spdf = abs(fft(solution(:,int32(newN/2))));
spdf2 = spdf(1:Nt/2);
fftVal = spdf2;
fftx=(1:Nt/2)*(1/tmax);
plot(fftx,fftVal);
set(gca,'XTick',0:250:5000)
axis([0 5000 10^(-1) +inf])
set(handles.xFFT,'XGrid','on')
xlabel('f[Hz]');
ylabel('A');
title('Spettro del segnale alla posizione x fissata');

set(handles.text4,'String',Nt-1);
set(handles.tSlider,'Max',Nt-1);

set(handles.f1Edit,'String',f1);
set(handles.f2Edit,'String',f2);
set(handles.fdpEdit,'String',2*f1 - f2);
set(handles.ratioEdit,'String',f2/f1);
xf1 = getX(f1);
xf2 = getX(f2);
xfdp = getX(2*f1-f2);
set(handles.xf1Edit,'String',xf1*1000);
set(handles.xf2Edit,'String',xf2*1000);
set(handles.xfdpEdit,'String',xfdp*1000);

if(sType == 2 | sType == 3)
    set(handles.dpPanel,'Visible','on');
end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Xfix_Tfix wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Xfix_Tfix_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function tSlider_Callback(hObject, eventdata, handles)
% hObject    handle to tSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of
%        slider
load('output/tempFileName.mat');
load(toImport);
set(handles.tEdit,'String',num2str(get(handles.tSlider,'Value')*(tmax/Nt)*1000));
axes(handles.tAx);
sliderPos = int32(get(handles.tSlider,'Value'));
plot(surfx,solution(sliderPos,:));
xlabel('x(mm)');
ylabel('A');

[n,m] = min(solution);
minY = min(n);


[l,s] = max(solution);
maxY = max(l);
grid on


% --- Executes during object creation, after setting all properties.
function tSlider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function tEdit_Callback(hObject, eventdata, handles)




function tEdit_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function xSlider_Callback(hObject, eventdata, handles)
load('output/tempFileName.mat');
load(toImport);
newN = N ; sol = solution;





stepx = L/newN ;
sliVal = double(get(handles.xSlider,'Value'));
set(handles.xEdit,'String',sliVal*stepx*1000);

axes(handles.xAx)
plot(surfy,sol(:,int32(sliVal)));
xlabel('t[s]');
ylabel('A');
grid on

axes(handles.xFFT)
spdf = abs(fft(sol(:,int32(sliVal))));
spdf2 = spdf(1:Nt/2);
fftVal = spdf2;

if (get(handles.linRadio,'Value') == 0)
    semilogy(fftx,fftVal);
else
    plot(fftx,fftVal);
end



title('Spettro del segnale alla posizione x fissata');
set(gca,'XTick',0:250:5000)
set(handles.xFFT,'XGrid','on')

axis([0 5000 10^(-1) +inf])

%@@@@ For Jasa --------------

figure
plot(fftx,fftVal);
xlabel('F (Hz)');
ylabel('A');

figure 
plot(surfy,sol(:,int32(sliVal)));
xlabel('t[s]');
ylabel('A');
grid on

nZeri= int32((Nt*1.75*10^(-3))/tmax); 

newSol = sol(:,int32(sliVal));
[zo zoo] = size(newSol);
newSol = newSol(nZeri:zo);
spdfz = abs(fft(newSol));
spdfz = spdfz(1:zo/2);
figure 
plot(spdfz)

%@@@@ For Jasa --------------
  
    

function xSlider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
load('output/tempFileName.mat');
load(toImport);
newN = N ;
stepx = L/newN ;
set(hObject,'Max',int32(newN));
set(hObject,'Value',int32(newN/2));





function xEdit_Callback(hObject, eventdata, handles)

function xEdit_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
load('output/tempFileName.mat');
load(toImport);
newN = N ;
set(hObject,'Value',int32(newN/2));


% --- Executes during object creation, after setting all properties.
function NEdit_CreateFcn(hObject, eventdata, handles)
load('output/tempFileName.mat');
load(toImport);
newN = N ;
set(hObject,'String',num2str(newN));


function text4_CreateFcn(hObject, eventdata, handles)
load('output/tempFileName.mat');
load(toImport);
set(hObject,'String',num2str(Nt));

function f1Edit_Callback(hObject, eventdata, handles)


function f1Edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f2Edit_Callback(hObject, eventdata, handles)



function f2Edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fdpEdit_Callback(hObject, eventdata, handles)

function fdpEdit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xf1Edit_Callback(hObject, eventdata, handles)

function xf1Edit_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xf2Edit_Callback(hObject, eventdata, handles)



function xf2Edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xfdpEdit_Callback(hObject, eventdata, handles)

function xfdpEdit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ratioEdit_Callback(hObject, eventdata, handles)


function ratioEdit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function linRadio_Callback(hObject, eventdata, handles)
load('output/tempFileName.mat');
load(toImport);
newN = N ; sol = solution;

stepx = L/newN ;
sliVal = double(get(handles.xSlider,'Value'));


axes(handles.xFFT)
spdf = abs(fft(sol(:,int32(sliVal))));
spdf2 = spdf(1:Nt/2);
fftVal = spdf2;
plot(fftx,fftVal);
title('Spettro del segnale alla posizione x fissata');
set(gca,'XTick',0:250:5000)
set(handles.xFFT,'XGrid','on')
axis([0 5000 10^(-1) +inf])




function logRadio_Callback(hObject, eventdata, handles)
load('output/tempFileName.mat');
load(toImport);
newN = N ; sol = solution;

stepx = L/newN ;
sliVal = double(get(handles.xSlider,'Value'));


axes(handles.xFFT)
spdf = abs(fft(sol(:,int32(sliVal))));
spdf2 = spdf(1:Nt/2);
fftVal = spdf2;
semilogy(fftx,fftVal);
set(gca,'XTick',0:250:5000)
axis([0 5000 0 +inf])
set(handles.xFFT,'XGrid','on')
title('Spettro del segnale alla posizione x fissata');






