function vMass = massIT(vettore)
%
% vMass = massIT(t,y,vettore)
% funzione "gemella" della mass.m ma che genera il prodotto della 
% matrice di massa per "vettore" e lo mette in vMass
%
global Bmat F 
global B Cmat massCalls
%global uquad actual_x 

massCalls=massCalls+1;


% Bnl = eye(ncb); % con questa approx si ottiene il solito sistema 1-d
%Cnl = -B + speye(ncb);    

% calcola v1
v1=F\(Cmat*vettore); % F e' a banda "stretta" -> uso banded Gauss

 % calcola v2
%v2=B\(Cnl*v1); % Bnl e' a banda "stretta" -> uso banded Gauss
v2=B\v1;

 
vMass = vettore-Bmat*v2;

