%Advanced Cochlear Simulator . 
%Developed by Paternoster - Moleti - Sisto - Sanjust  
%Universita' degli studi di Roma - Tor Vergata 
%Mailto:paternoster.nicolo@gmail.com


%+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****
%----------------------------  GUI ------------------------------------
%+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****

function varargout = cochlearSolver(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cochlearSolver_OpeningFcn, ...
                   'gui_OutputFcn',  @cochlearSolver_OutputFcn, ...
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
function cochlearSolver_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);
end

function varargout = cochlearSolver_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
end


function nEdit_Callback(hObject, eventdata, handles)
end
function nEdit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


end

function graphCheck_Callback(hObject, eventdata, handles)
end

function epsilon_Callback(hObject, eventdata, handles)
end
function epsilon_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function doubleCheck_Callback(hObject, eventdata, handles)
end

function gamma_Callback(hObject, eventdata, handles)
end
function gamma_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function solveBert_Callback(hObject, eventdata, handles)
if (strcmp(get(handles.tePanel,'Visible'),'on'))
    sType = 0;
elseif (strcmp(get(handles.sfPanel,'Visible'),'on'))
    sType = 1;
    sSf = str2double(get(handles.sfEdit,'String'));
elseif (strcmp(get(handles.dpPanel,'Visible'),'on'))
    sType = 2;
    sF1 = str2double(get(handles.f1,'String'));
    sF2 = str2double(get(handles.f2,'String'));
elseif (strcmp(get(handles.dpSPanel,'Visible'),'on'))
    serieDir = get(handles.serieNameEdit,'String');
    sRatio=str2double(get(handles.sRatio,'String'));
    sType = 3;
else
    
end
 % will add an abort button  
if (sType == 3)
gui_active(1);
overallBar = progressbar( [],0,'DP Serie overall progress...','Advanced Cochlear Solver' );
end
cd iterativeSolver;
N=(str2double(get(handles.nEdit,'String')));
%Creo un vettore random per le roughness 
for f=1:N
     rough(f) = rand(1)-0.5;
end
eps=str2double(get(handles.epsilon,'String'));
eps=eps/50; 
nonlinz=str2double(get(handles.gamma,'String'));
omega0=str2double(get(handles.w0Edit,'String'));%Espressa in DB
omega0=(10^(omega0/20))/(3.3*10^3);%Accelerazione in pressione agli stapes ----Se si cambia qui anche in cochlearAnalysis.m
enneti = str2double(get(handles.NtEdit,'String'));
tm = str2double(get(handles.tmaxEdit,'String'));
graphCheck = get(handles.graphCheck,'Value');
sSf=0;sF1=0;sF2=0; %INIZIALIZZO
serieDir ='';
serieName=0;

teType = get(handles.teSelect,'Value');

sFstart = str2double(get(handles.f1Start,'String'));
sFstop = str2double(get(handles.f1Stop,'String'));
sDf = str2double(get(handles.sDf,'String'));
c = clock ;
doubleCheck = get(handles.doubleCheck,'Value');
serieId = strcat(num2str(c(3), '%d'),'-',num2str(c(2), '%d'),'@',num2str(c(4), '%d'),'-',num2str(c(5), '%d'),'_');
nonlin(1:N+1) = nonlinz; 
if(sType~=3)    
    ITsolver(N,eps,nonlin,sType,sSf,sF1,sF2,omega0,enneti,tm,teType,serieDir,serieName,0,0,0,0,serieId,rough,graphCheck);
else
    npassi = ((sFstop-sFstart)/sDf)+1; 
    macroTime = tic;

    for o=1:npassi
        %progressbar(o/barMax,0);
        cd .. 
        overallBar = progressbar( overallBar, 1/npassi );
        cd iterativeSolver;
        disp(' ');
        disp('##############################################################');
        disp(sprintf('-----!!!!! Serie DP : passo numero %d -----!!!!!',int32(o)));
        disp(sprintf('-----Passi totali: %d -----!!!!!',int32(npassi)));
        disp('');
        if(doubleCheck == 1)  disp('####### Double Mode ####### '); disp('  ');
        end
        effe1=sFstart+((o-1)*sDf);
        effe2=effe1*sRatio;
        if(doubleCheck == 1)            
             ITsolver(N,eps,nonlin,sType,sSf,effe1,effe2,omega0,enneti,tm,teType,serieDir,o,sFstart,sFstop,sDf,sRatio,serieId,rough,graphCheck)
              
             %Genero Funzione gaussiana-------
             xf2 = getX(effe2);
             indicexf2 = (xf2 * N / 0.035);           
              for i=1:N+1
              nonlin(i) = nonlinz * exp(-(4*i/indicexf2)^2);
              end               
              ITsolver(N,eps,nonlin,sType,sSf,effe1,effe2,omega0,enneti,tm,teType,strcat(serieDir,'_lin'),o,sFstart,sFstop,sDf,sRatio,serieId,rough,graphCheck); %Nonlin=0
              nonlin(1:N+1) = nonlinz; 
              
        else
              ITsolver(N,eps,nonlin,sType,sSf,effe1,effe2,omega0,enneti,tm,teType,serieDir,o,sFstart,sFstop,sDf,sRatio,serieId,rough,graphCheck);
              
        end
        
    end
    tTot = toc(macroTime);
    DP_output_folder = '../output/';
    L=0.035; % Da sistemare meglio questa cosa
    save(strcat(DP_output_folder,serieId,'_',serieDir,'cfg.mat'),'sFstart','sFstop','N','tm','sDf','sRatio','L','tTot','nonlin','doubleCheck')
    disp(sprintf('@@@@@ Tempo totale di elaborazione della serie :  %d ore',(tTot/60)/60));
    
end
cd ..;
if (sType == 3)
progressbar( overallBar,-1 ); 
end
clear all;
end






function solveBtn_Callback(hObject, eventdata, handles)
if (strcmp(get(handles.tePanel,'Visible'),'on'))
    sType = 0;
elseif (strcmp(get(handles.sfPanel,'Visible'),'on'))
    sType = 1;
    sSf = str2double(get(handles.sfEdit,'String'));
elseif (strcmp(get(handles.dpPanel,'Visible'),'on'))
    sType = 2;
    sF1 = str2double(get(handles.f1,'String'));
    sF2 = str2double(get(handles.f2,'String'));
elseif (strcmp(get(handles.dpSPanel,'Visible'),'on'))
    serieDir = get(handles.serieNameEdit,'String');
    sRatio=str2double(get(handles.sRatio,'String'));
    sType = 3;
else    
end
N=(str2double(get(handles.nEdit,'String')));
if (sType == 3)
gui_active(1);
h = progressbar( [],0,'DP Serie overall progress...','Advanced Cochlear Solver' );
end
%Creo un vettore random per le roughness 
for f=1:N
     rough(f) = rand(1)-0.5;
end
eps=str2double(get(handles.epsilon,'String'));
eps=eps/50; 
nonlinz=str2double(get(handles.gamma,'String'));
omega0=str2double(get(handles.w0Edit,'String'));%Espressa in DB
omega0=(10^(omega0/20))/(3.3*10^3);%Accelerazione in m/s^2 ----Se si cambia qui anche l'analyzer
enneti = str2double(get(handles.NtEdit,'String'));
tm = str2double(get(handles.tmaxEdit,'String'));
graphCheck = get(handles.graphCheck,'Value');
sSf=0;sF1=0;sF2=0; %INIZIALIZZO
serieDir ='';
serieName=0;

teType = get(handles.teSelect,'Value');

sFstart = str2double(get(handles.f1Start,'String'));
sFstop = str2double(get(handles.f1Stop,'String'));
sDf = str2double(get(handles.sDf,'String'));
c = clock ;
doubleCheck = get(handles.doubleCheck,'Value');
serieId = strcat(num2str(c(3), '%d'),'-',num2str(c(2), '%d'),'@',num2str(c(4), '%d'),'-',num2str(c(5), '%d'),'_');
nonlin(1:N+1) = nonlinz; 
if(sType~=3)    
    solver(N,eps,nonlin,sType,sSf,sF1,sF2,omega0,enneti,tm,teType,serieDir,serieName,0,0,0,0,serieId,rough,graphCheck);
else
    npassi = ((sFstop-sFstart)/sDf)+1; 
    macroTime = tic;
    for o=1:npassi
        h = progressbar( h,1/npassi );
        disp(' ');
        disp('##############################################################');
        disp(sprintf('-----!!!!! Serie DP : passo numero %d -----!!!!!',int32(o)));
        disp(sprintf('-----Passi totali: %d -----!!!!!',int32(npassi)));
        disp('');
        if(doubleCheck == 1)  disp('####### Double Mode ####### '); disp('  ');
        end
        effe1=sFstart+((o-1)*sDf);
        effe2=effe1*sRatio;
        if(doubleCheck == 1)            
             solver(N,eps,nonlin,sType,sSf,effe1,effe2,omega0,enneti,tm,teType,serieDir,o,sFstart,sFstop,sDf,sRatio,serieId,rough,graphCheck)
              
             %Genero Funzione gaussiana-------
             xf2 = getX(effe2);
             indicexf2 = (xf2 * N / 0.035);           
              for i=1:N+1
              nonlin(i) = nonlinz * exp(-(4*i/indicexf2)^2);
              end               
              solver(N,eps,nonlin,sType,sSf,effe1,effe2,omega0,enneti,tm,teType,strcat(serieDir,'_lin'),o,sFstart,sFstop,sDf,sRatio,serieId,rough,graphCheck); %Nonlin=0
              nonlin(1:N+1) = nonlinz; 
        else
              solver(N,eps,nonlin,sType,sSf,effe1,effe2,omega0,enneti,tm,teType,serieDir,o,sFstart,sFstop,sDf,sRatio,serieId,rough,graphCheck);
        end
        
    end
    tTot = toc(macroTime);
    DP_output_folder = 'output/';
    L=0.035; % Da sistemare meglio questa cosa
    save(strcat(DP_output_folder,serieId,'_',serieDir,'cfg.mat'),'sFstart','sFstop','N','tm','sDf','sRatio','L','tTot','nonlin','doubleCheck')
    disp(sprintf('@@@@@ Tempo totale di elaborazione della serie :  %d ore',(tTot/60)/60));   
end
if (sType == 3)progressbar( h,-1 ); end
end

function nSlider_Callback(hObject, eventdata, handles)
set(handles.nEdit,'String',int32(get(handles.nSlider,'Value')));
end
function nSlider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end

function teSelect_Callback(hObject, eventdata, handles)


end

% --- Executes during object creation, after setting all properties.
function teSelect_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
temp  = struct('type',{'Click 0.0002 s - 2.5 kHz','Click 0.0001 s - 5 kHz','Click 0.00008 s - 6 kHz','Click 0.00005 s - 10kHz'});
temp2 = struct2cell(temp);
set(hObject,'String',temp2);
end

function sfSlider_Callback(hObject, eventdata, handles)
set(handles.sfEdit,'String',int32(get(handles.sfSlider,'Value')));
end

function sfSlider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


function sfEdit_Callback(hObject, eventdata, handles)
end

function sfEdit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function f1_Callback(hObject, eventdata, handles)
f1 = str2double(get(hObject,'String'));
f2 = f1 * str2double(get(handles.dpRatioEdit,'String'));
dp = 2*f1 - f2;

set(handles.f2,'String',f2);
set(handles.dpEdit,'String',dp);
end

function f1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function f2_Callback(hObject, eventdata, handles)
end

function f2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function dpEdit_Callback(hObject, eventdata, handles)
end

function dpEdit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    set(handles.dpEdit,'String',(2*int32(get(handles.f2,'String'))) - int32(get(handles.f1,'String')));
end
end


function dpRatioEdit_Callback(hObject, eventdata, handles)
f1 = str2double(get(handles.f1,'String'));
f2 = f1 * str2double(get(hObject,'String'));
dp = 2*f1 - f2;
set(handles.f2,'String',f2);
set(handles.dpEdit,'String',dp);

end


function dpRatioEdit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function teRadio_Callback(hObject, eventdata, handles)
set(handles.sfPanel,'Visible','off');
set(handles.tePanel,'Visible','on');
set(handles.dpPanel,'Visible','off');
set(handles.dpSPanel,'Visible','off');
end


function sfRadio_Callback(hObject, eventdata, handles)
set(handles.sfPanel,'Visible','on');
set(handles.tePanel,'Visible','off');
set(handles.dpPanel,'Visible','off');
set(handles.dpSPanel,'Visible','off');
end


function dpRadio_Callback(hObject, eventdata, handles)
set(handles.sfPanel,'Visible','off');
set(handles.tePanel,'Visible','off');
set(handles.dpPanel,'Visible','on');
set(handles.dpSPanel,'Visible','off');
end

function serieRadio_Callback(hObject, eventdata, handles)
set(handles.sfPanel,'Visible','off');
set(handles.tePanel,'Visible','off');
set(handles.dpPanel,'Visible','off');
set(handles.dpSPanel,'Visible','on');
end

function w0Edit_Callback(hObject, eventdata, handles)
end

function w0Edit_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    end
end

function tmaxEdit_Callback(hObject, eventdata, handles)
end

function tmaxEdit_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function NtEdit_Callback(hObject, eventdata, handles)
end

function NtEdit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function serieNameEdit_Callback(hObject, eventdata, handles)
end

function serieNameEdit_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function f1Stop_Callback(hObject, eventdata, handles)
end

function f1Stop_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function f1Start_Callback(hObject, eventdata, handles)
end

function f1Start_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function sRatio_Callback(hObject, eventdata, handles)
end

function sRatio_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function sDf_Callback(hObject, eventdata, handles)
end



function sDf_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function getOra = ora()
c = clock ;
getOra = strcat(num2str(c(4), '%d'),':',num2str(c(5), '%d'),':',num2str(int32(c(6)), '%d'));
end

function getData = data()
c = clock ;
getData = strcat(num2str(c(1), '%d'),'/',num2str(c(2), '%d'),'/',num2str(int32(c(3)), '%d'));
end

%+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****
%------------------------- END  GUI -----------------------------------
%+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****





