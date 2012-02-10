%+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****
%---------------------------- SOLVER ----------------------------------
%+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****

function solver(sezioni,roughness,nonlin,sType,sSf,sF1,sF2,omegazero,enneti,tm,teType,sDir,sName,fmin,fmax,stepf,ratio,sId,randVector,graphCheck)
timeTot = tic; % Parte il timer 
global stepsNumber invMat;
stepsNumber =0 ;
beginTime=ora(); %Ora corrente
Date = data(); %Data corrente
disp(beginTime);
disp('+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****');
disp('---------------------------- SOLVER ----------------------------------');
disp('+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****');
disp('-- Soluzione modello numerico - BertacciniPaternosterMoleti --- Starts');


freq=sSf;f1=sF1; f2=sF2;
%Stimolo ------------------------------------------

function yp = f(t,y)  
    stimLenght = 0.0;
   if (sType == 0)
       if(teType==1) stimLenght = 0.0002;
       elseif(teType==2) stimLenght = 0.0001;
       elseif(teType==3) stimLenght = 0.00008;
       elseif(teType==4) stimLenght = 0.00005;
       end
       yp = outm*y+w0*Bmat*q*sinc((t-0.0002)/stimLenght);   
   elseif (sType == 1)
          yp= outm*y+w0*Bmat*q*sin(2*t*pi*freq);      
   elseif (sType == 2)
           yp = outm*y+w0*Bmat*q*(3*sin(2*pi*f1*t)+sin(2*pi*f2*t) );
   elseif (sType == 3)
           yp = outm*y+w0*Bmat*q*(3*sin(2*pi*f1*t)+sin(2*pi*f2*t) );
   else  
       
   end 
end 
%Stimolo ------------------------------------------

N=double(sezioni); %Numero di elementi micromeccanici
eps=roughness; % Parametro di roughness (x100)
gamma = 0.36; %Costante moltiplicativa per la non linearita'     AAAAA
% gamma = 0.52; %Costante moltiplicativa per la non linearita'     AAAAA
w0= omegazero; %Ampiezza dello stimolo
Nt= enneti; %Numero di punti temporali
tmax = tm; %Tempo di acquisizione
%assignin('base', 'nonlin', nonlin*10^7);
disp(sprintf('--Tic started : Inizializo Variabili'));
disp(sprintf('----- Numero di partizioni: %d ',N));
disp(sprintf('----- Roughness : %d permille',int32(eps*1000)));
disp(sprintf('----- NonLinear Param : %d * 10^7',nonlin(1)));
Nl = 2; % gradi di liberta' del singolo elemento micromeccanico
n = N*Nl+2+1; % dimensione matrice di massa LXL (righe e col. di A, righe di B, col. di C)
ncb = N+2; % colonne di B (righe di C, righe e col. di F)
Nx=175 ; %numero di partizioni per il plot (def:175)
y0 = repmat(0,n,1); % condizione iniziale
tspan = [0; tmax];% range temporale per la soluzione
kw=138.2; %Costante moltiplicativa per la mappa di Greenwood

%Inizializzazione matrici ----------------------------
ys=repmat(0,Nt,N);
ysx=repmat(0,Nt,Nx);
outm = repmat(0,0,0);
Mass = repmat(0,0,0);
Mass1 = repmat(0,0,0);
B = repmat(0,ncb,ncb);
Bnl = repmat(0,ncb,ncb);
Cnl = repmat(0,ncb,ncb);
Bmat = repmat(0,n,ncb);
Cmat = repmat(0,ncb,n);
x = repmat(0,ncb,1);
q = repmat(0,ncb,1);
alpha= repmat(0,ncb,1);
sum = repmat(0,ncb,1);
K1 =repmat(0,N,1);
C1 =repmat(0,N,1);
M11 = repmat(0,N,1);
M12 = repmat(0,N,1);


L = 0.035;%lunghezza della coclea
D=L/N; %Distanza tra due partizioni

lambda = (L/30)^2;  % Banda critica : circa un terzo d'ottava

%Orecchio medio
Ks = 2.1* 10^8;
Cs = 5000;
Ms = 1.85;

ro = 1000;  %Densita' del liquido
M1 = 5.5*10^(-2);
% H=0.001;%Altezza della coclea                                     AAAAA
H=ro*2/(M1*3100^2);%Altezza della coclea                           AAAAA
K = 1;
q(1) =1;

%Crea l'id del file a partire da giorno mese minuto e ora corrente (MMGG.hhmm)
c = clock ;
fileId = strcat(num2str(c(3), '%d'),'-',num2str(c(2), '%d'),'@',num2str(c(4), '%d'),'-',num2str(c(5), '%d'));
if(sType == 0 ) prefix = 'TE_';
    elseif(sType == 1 ) prefix = 'SF_';
    elseif   (sType == 2 ) prefix = 'DP_'; 
else prefix = '';
end   
filename = strcat(prefix,'N',num2str(N, '%d'),'___',fileId,'.mat');
outdir = 'output/';
dest = strcat(outdir,filename);



%Fattore di qualit? dinamico
Qf = 5;
beta=0.3;
for j =1:N
    currentPos = D*j;
    currentFreq = getFreq(currentPos)/1000;
     Qn(j)=Qf*currentFreq^(beta);
%    Qn(j)=Qf;
end

%Riempimento vettori e matrici -------------------------------------
for j =1:N
x(j) = L*j/N;%Vettore di displacement
K1(j) = (-2*pi*145+(2*pi*20655)*exp(-kw*x(j)))^2; % *omega^2
M12(j) = -K1(j)*(1+eps*(randVector(j))); 
C1(j)= sqrt(M1*K1(j))/Qn(j); %Gamma
M11(j) = -C1(j);
Mso  = [M11(j) M12(j); 1 0];
outm = blkdiag(outm,Mso); % costruzione della matrice AE
Cmat(j+1,Nl*(j-1)+3)=1;
Bmat(Nl*(j-1)+3,j+1)=1/M1;
end

A1=[-Cs/Ms -Ks/Ms; 1 0];
An=0;
outm = blkdiag(A1,outm);
outm = blkdiag(outm,An);
Bmat(1,1)=1/Ms;
Bmat(2,1)=0;
Cmat(1,1)=1;
Cmat(1,2)=0;
Bmat(n,ncb)=0;
Cmat(ncb,n)=0;
e = ones(ncb,1);
F = spdiags([e -2*e e], -1:1, ncb, ncb); % operatore alle differenze finite
F(1,1)=-D/H;
F(1,2)=D/H;
F(ncb,ncb-1)=0;
F(ncb,ncb)=-2*ro*D^2/H;
F=F/(2*ro*D^2/H); % normalizzazione matrice F
Finv = inv(F);
disp('--Parametri inizializzati');

%Fine Inizializzazioni -------------------------------------------


% Ode15-----------------------------------Soluzione equazione differenziale
disp(ora());
disp('----lancio ode15s');
options = odeset('Mass',@mass,'MStateDep','strong');
[t,y] = ode15s(@f,tspan,y0,options);
disp('----fine ode15s');
disp(ora());
disp('---- Inizio Calcolo FFT');
%Fine Ode15-----------------------------------

%Sottocampionamento nel tempo per la FFT
st =size(t); %Variabile
dtf=tmax/Nt; %Step
for j=1:N    
ysel(:,j)= y(:,j*Nl);
end
for it=1:Nt
    for jt=1:st-1
        ys(it,:)=ys(it,:)+(t(jt+1)>it*dtf).*(t(jt)<it.*dtf).*(ysel(jt,:)+(ysel(jt+1,:)-ysel(jt,:))./(t(jt+1)-t(jt)).*(it*dtf-t(jt)));
    end
end

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

subsolution = ysx * 10^6 ;
solution = ys * 10^6 ;

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
disp('--Fine Calcolo FFT');
disp(ora());
xlabel('f');
ylabel('A');

subplot(2,2,[1 2]);
if(N>Nx) surfc(subsurfx,surfy,subsolution);
else surfc(surfx,surfy,solution); 
end
view(160,45);
xlabel('space (mm)');
ylabel('time (ms)');
zlabel('solution (micron)');

subplot(2,2,4);
plot(surfy,solution(:,1));
title('Base');
end
%-------------------------------------------------------------------------
%Fine Plots

disp(sprintf('-----------  Fine esecuzione '));
timeElapsed = toc(timeTot);
disp(sprintf('----- Tempo impiegato : %d ore',(timeElapsed/60)/60));
%Salva su file i dati di output
gamma2=gamma; epsilon=eps;
if(sType == 3)
    DP_output_folder = 'output/';
    dest = strcat(DP_output_folder,sId,'_',sDir,num2str(sName,'%d'),'.mat');
    
end
save(dest,'beginTime','Date','freq','H','lambda','Ks','Ms','Cs','ro','f1','f2','M1','N','Nt','Nx','D','tmax','gamma2','epsilon','timeElapsed','fftx','fftVal','surfx','surfy','solution','subsolution','L','w0','Qf','sType','subsurfx','stimLenght','nonlin');
disp(sprintf('-----------  Salvo il risultato della simulazione sul file '));
disp(dest);
disp(ora());
disp('-------------------------------FINE---------------------------------');
disp(' ');disp(' ');disp(' ');disp(' ');disp(' ');disp(' ');



%+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****
%----------------------- Altre funzioni -------------------------------
%+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****+++++*****

function getOra = ora()
c = clock ;
getOra = strcat(num2str(c(4), '%d'),':',num2str(c(5), '%d'),':',num2str(int32(c(6)), '%d'));
end

function getData = data()
c = clock ;
getData = strcat(num2str(c(1), '%d'),'/',num2str(c(2), '%d'),'/',num2str(int32(c(3)), '%d'));
end

 

function Mt = mass(t,y)
stepsNumber = stepsNumber +1;
% for i=1:ncb-1     % AAAAA
for i=2:ncb-1     % AAAAA
    sum(i)=0;
% for j=1:ncb-1     % AAAAA
 for j = 2:ncb-1    % AAAAA
 B(i,j)=0;
 %Termine non lineare ( Sia passivo non lineare che attivo ) 
% ef = gamma*(1-(nonlin(j)*10^7*y(j*2,:))^2)/sqrt(lambda*pi)*exp(-((x(i)-x(j))^2/lambda)); %  AAAAA
ef = gamma * (tanh(1/(y(j*2,:)*nonlin(j)*10^7)^2))^4 /    sqrt(lambda*pi)*exp(-((x(i)-x(j))^2/lambda)); %  AAAAA
 sum(i) = sum(i) + ef*D; %integrazione
 end
alpha(i) = sum(i); %costruzione degli elementi alpha
end

  % for L2=1:ncb-K %AAAAA
  for L2=2:ncb-K %AAAAA
    B(L2+K,L2)=-alpha(L2); %matrice di accoppiamento non lineare
  end
B(ncb,ncb)=0;
Bnl = B + eye(ncb);
binv =inv(Bnl);
Cnl = -Bnl + eye(ncb);    
Mass1 = (binv*Cnl+eye(ncb))*Finv; % G*A di Xin
Mass = eye(n)-Bmat*Mass1*Cmat; %mass matrix Bertaccini
Mt = Mass;    
end                   % End nested function mass
%--------------------------------------------------------------

end




