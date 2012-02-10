function ITsolver(sezioni,roughness,nonlin,sT,sf,sF1,sF2,omegazero,enneti,tm,teT,sDir,sName,fmin,fmax,stepf,ratio,sId,randVector,graphCheck)
timeTot = tic;
beginTime=ora(); %Ora corrente
Date = data(); %Data corrente

global totiter bicgcalls iterativo ndecomps 
global precond iter_tol iter_maxit
global stampa  usa_quad

global outm w0 Bmat q f1 f2 x nls eps Lcoclea %tuttiuno
global ncb B gamma lambda D hstep K n Cmat massCalls 

global sSf teType stimLenght sType pbar

% 
global F Finv

format short e
disp('+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****');
disp('------------------- ADVANCED COCHLEAR SOLVER --------------------------');
disp('+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****');



iterativo=1 ;
totiter=0;
bicgcalls=0; 
ndecomps=0;
precond=0;
iter_tol=1e-8;
iter_maxit=500; % MAX number of inner it.
stampa=1;
massCalls=0; % inizializzo il numero di chiamate alla mass matrix
usa_quad=0; % usa calcolo di alpha con funz. quad.m e nonlocal_alpha.m
            % piu' lento ma piu' accurato

N = double(sezioni);
eps = roughness;
tmax=tm;
Nt=enneti;
f1=sF1;
f2=sF2;
sSf = sf;
sType = sT;
teType = teT;
w0=omegazero;
            
            
            
Nl = 2; % gradi di libertà del singolo elemento micromeccanico
n = N*Nl+2+1; % dimensione matrice di massa LXL (righe e col. di A, righe di B, col. di C)
ncb = N+2; % colonne di B (righe di C, righe e col. di F)

%tuttiuno=ones(ncb-1,1);

y0 = repmat(0,n,1); % condizione iniziale

% ESTREMI DI INTEGRAZIONE TEMPORALE
t0=0; tFinal=tmax; 

tstep=(tFinal-t0)/Nt;
tspan = t0:tstep:tFinal;
kw=138.2;
% frequenze primarie per evocare il dp


c = clock ;
fileId = strcat(num2str(c(3), '%d'),'-',num2str(c(2), '%d'),'@',num2str(c(4), '%d'),'-',num2str(c(5), '%d'));
if(sType == 0 ) prefix = 'TE_bert_';
    elseif(sType == 1 ) prefix = 'SF_bert_';
    elseif   (sType == 2 ) prefix = 'DP_bert_'; 
else prefix = '';
end   
filename = strcat(prefix,'N',num2str(N, '%d'),'___',fileId,'.mat');
outdir = '../output/';
dest = strcat(outdir,filename);

Nx = 175;
ys=repmat(0,Nt,N);
ysx=repmat(0,Nt,Nx);
outm = repmat(0,0,0);
G = repmat(0,0,0);
Mass = repmat(0,0,0);
Mass1 = repmat(0,0,0);
Cnl = repmat(0,ncb,ncb);
Bmat = repmat(0,n,ncb);
Cmat = repmat(0,ncb,n);
Dmat = repmat(0,ncb,n);
x = repmat(0,ncb,1);
q = repmat(0,ncb,1);
alpha= repmat(0,ncb,1);
sum = repmat(0,ncb,1);
Mso = repmat(0,Nl,Nl);
K1 =repmat(0,N,1);
C1 =repmat(0,N,1);
M11 = repmat(0,N,1);
M12 = repmat(0,N,1);
Qf=25;

gamma = 0.36;

nls = nonlin *10^7;
%nls=1e+8;


g = 1;
b = 0.4;
L = 0.035; Lcoclea=L;
D=L/N; hstep=D;

lambda = (L/100)^2 ; % circa un decimo d'ottava


Ks = 2*10^8;
Cs = 5000;
Ms = 2;
ro = 1000;
M1 = 5.5*10^(-2);% BM density in kg/m2
H=ro*2/(M1*(3100^2));
K = 1;

q(1) =1;


beta=0.3;
disp(sprintf('--Tic started : Inizializo Variabili'));
disp(sprintf('----- Numero di partizioni: %d ',N));
disp(sprintf('----- Roughness : %d permille',int32(eps*1000)));
disp(sprintf('----- NonLinear Param : %d * 10^7',nonlin(1)));
for j =1:N
    currentPos = D*j;
    currentFreq = getFreq(currentPos)/1000;
    % Qn(j)=Qf*currentFreq^(beta);
    Qn(j)=Qf;
end


for j =1:N
  x(j) = L*j/N;
  K1(j) = M1*(2*pi*20655)^2*exp(-2*kw*x(j));
  C1(j)= sqrt(M1*K1(j))/Qn(j);
  M11(j) = -C1(j)/M1;
  M12(j) = -(K1(j)/M1)*(1+eps*(randVector(j)));%-omega(x)^2  con roughness
  Mso  = [M11(j) M12(j); 1 0];
  outm = blkdiag(outm,Mso); % costruzione della matrice AE
  Cmat(j+1,Nl*(j-1)+3)=1;
  Dmat(j+1,Nl*(j-1)+4)=1;
  Bmat(Nl*(j-1)+3,j+1)=1/M1;
end
A1=[-Cs/Ms -Ks/Ms; 1 0];
An=[0];
outm = blkdiag(A1,outm);
outm = blkdiag(outm,An);
B1=[1/Ms;0];
C1=[1 0];
Bmat(1,1)=1/Ms;
Bmat(2,1)=0;
Cmat(1,1)=1;
Cmat(1,2)=0;
Dmat(1,1)=0;
Dmat(1,2)=1;
Bmat(n,ncb)=0;
Cmat(ncb,n)=0;
Dmat(ncb,n)=0;
e = ones(ncb,1); % vettore colonna
F = spdiags([e -2*e e], -1:1, ncb, ncb); % operatore laplaciano alle differenze finite
%condizioni al contorno nei primi e ultimi elementi di F
F(1,1)=-D/H;
F(1,2)=D/H;
F(ncb,ncb-1)=0;
F(ncb,ncb)=-2*ro*D^2/H;
% normalizzazione e inversione matrice F
F=F/(2*ro*D^2/H); 

% DAN: sparsification of matrices
outm=sparse(outm);
Cnl=sparse(Cnl);
Cmat=sparse(Cmat);
Dmat=sparse(Dmat);

%Bnl=sparse(Bnl);
Bmat=sparse(Bmat);
B=speye(ncb); % resetta la B

% DAN: DA EVITARE (1) *****
Finv = inv(F);

disp('Now start time step integrator')
%save nlsodp_data

% DAN: Jacobian matrix is constant (linear problem in y)
%'RelTol',1e-2
options = odeset('Mass',@mass,'MStateDep','weak','Jacobian',outm);

%disp('Invio per iniziare integrazione')
%pause

[t,y] = ode15s(@f,tspan,y0,options);  
% st =size(t); %Variabile
% dtf=tm/Nt; %Step

for j=1:N   
ysel(:,j)= y(:,j*Nl);
end


% for it=1:Nt
%     for jt=1:st-1
%         ys(it,:)=ys(it,:)+(t(jt+1)>it*dtf).*(t(jt)<it.*dtf).*(ysel(jt,:)+(ysel(jt+1,:)-ysel(jt,:))./(t(jt+1)-t(jt)).*(it*dtf-t(jt)));
%     end
% end

ysel= ysel(1:Nt,:);
ys=ysel;

spdf = abs(fft(ys(:,1))); %FFT
spdf2 = spdf(1:Nt/2);
fftVal = spdf2*10^6;
fftx=(1:Nt/2)*(1/tmax);
fftx = fftx';
%fine fft------------------------------------------------


%Sotto Campiono nello spazio la soluzione 
if(N>Nx) %Altrimenti non serve sottocampionare ovviamente
sx =size(x);
dx=L/Nx;
for it=1:Nx
    for jt=1:sx-3
        ysx(:,it)=ysx(:,it)+(x(jt+1)>it*dx).*(x(jt)<it.*dx).*(ys(:,jt)+(ys(:,jt+1)-ys(:,jt))./(x(jt+1)-x(jt)).*(it*dx-x(jt)));
    end
end
end
%Fine sottocampionamento spaziale 
ys=ys(1:Nt,:);

subsolution = ysx * 10^6 ;%Sarebbe meglio alla dodicesima?
solution = ys * 10^6 ;%Sarebbe meglio alla dodicesima?

surfx = (1:N)*L*1000/(N+1);%Vettore per le ascisse spaziali
surfy = (1:Nt)*tmax/Nt ;%Vettore per le ascisse temporali
subsurfx =(1:Nx)*L*1000/(Nx+1); %Vettore sottocampionato per le ascisse spaziali


%Plots
%--------------------------------------------------------------------------
if(graphCheck==1)
figbound = [0, 0, 1440, 900];%Dimensioni della finestra
figure('Name',strcat('Inner Ear Model Solutions',filename),'NumberTitle','off','OuterPosition',figbound);
subplot(2,2,3);semilogy(fftx,fftVal);
axis([0 6000 0.006 1]);
disp(ora());
xlabel('f');
ylabel('A');

subplot(2,2,[1 2]);
if(N>Nx) surfc(subsurfx,surfy,subsolution);
else   
    surfc(surfx,surfy,solution); 
end
view(160,45);
xlabel('space (mm)');
ylabel('time (ms)');
zlabel('solution (micron)');

subplot(2,2,4);
plot(surfy,solution(:,1));
title('Base');
end



% [lent,leny]=size(y);
% 
%  figure;
%  t=t(1:Nt);
%   surf((1:N)*L*1000/(N+1),t*1000,ysel*1e+6);
%   view(160,45);
%   title(['cochlear problem, solved by ODE15S']);
%   titolo=['BM displacement'];
%   title(titolo)
%   xlabel('space (mm)');
%   ylabel('time (ms)');
%   zlabel('solution (micron)');%hold on
%   figure
% %   plot(ysel(200,:)*1e+6);%hold on
%     plot(t*1000,ysel(:,1)*3e+12);%hold on
%-------------------------------------------------------------------------
%Fine Plots

timeElapsed = toc(timeTot);
disp(sprintf('\n----- Tempo impiegato : %d ore',(timeElapsed/60)/60));



%Salvataggio Dati---------------------------------------------


if(sType == 3)
    dest = strcat(outdir,sId,'_',sDir,num2str(sName,'%d'),'.mat');   
end

%Tunnelling delle variabili:
freq=sf; 
tmax=tm;
gamma2=gamma; 
epsilon=eps;
save(dest,'beginTime','Date','freq','H','lambda','Ks','Ms','Cs','ro','f1','f2','M1','N','Nt','Nx','D','tmax','gamma2','epsilon','timeElapsed','fftx','fftVal','surfx','surfy','solution','subsolution','L','w0','Qf','sType','subsurfx','stimLenght','nonlin');
disp(sprintf('-----------  Salvo il risultato della simulazione sul file '));
disp(dest);
disp(ora());
disp(sprintf('-----------  Fine esecuzione '));
timeElapsed = toc(timeTot);
disp(sprintf('----- Tempo impiegato : %d ore',(timeElapsed/60)/60));
disp('-------------------------------FINE---------------------------------');
disp(' ');disp(' ');disp(' ');disp(' ');disp(' ');disp(' ');

if(sType~=3)
progressbar(1,0);
clear all
end

end
% end main code 

function getOra = ora()
c = clock ;
getOra = strcat(num2str(c(4), '%d'),':',num2str(c(5), '%d'),':',num2str(int32(c(6)), '%d'));
end

function getData = data()
c = clock ;
getData = strcat(num2str(c(1), '%d'),'/',num2str(c(2), '%d'),'/',num2str(int32(c(3)), '%d'));
end
