function Mass = mass(t,y)

global x Bmat 
global ncb B gamma lambda D nls K n Cmat Dmat massCalls gam_cell

% da eliminare
global Finv

massCalls=massCalls+1;
%fprintf('\nChiamata a mass.m...');

% Mass matrix function.
B=speye(ncb); % resetta la B
for i=2:ncb-1
    somma=0;
  for j = 2:ncb-1
    %B(i,j)=0;
     ef = gamma*(tanh(1/(nls(j).*y(j*2,:))^2))/sqrt(lambda*pi)*exp(-((x(i)-x(j))^2/lambda));
%      ef = gamma*(1-(nls*y(j*2,:))^2)/sqrt(lambda*pi)*exp(-((x(i)-x(j))^2/lambda));
     somma = somma + ef*D;
  end
  alpha(i) = somma; %costruzione degli elementi alpha
  B(i+1,i)=-alpha(i); 
  %Cnl(i+1,i)=alpha(i);
end
%for L2=1:ncb-K
%    B(L2+K,L2)=-alpha(L2); %matrice di accoppiamento non lineare
%end

% B is sparse 
%Bnl = B + speye(ncb);

% DAN: DA EVITARE (2) *****
%size(B)
binv =inv(B);

% Bnl = eye(ncb); % con questa approx si ottiene il solito sistema 1-d
Cnl = -B+ speye(ncb);    
%Mass1 = (binv*Cnl+speye(ncb))*Finv; % G*A di Xin
% G = (binv*Cnl+eye(ncb)); % matrice G(U) di Xin
% mass_csi1=gam_cell*binv*Cnl;
% mass_csi2 = eye(ncb)*Finv;
% Mass = speye(n)-Bmat*mass_csi1*Dmat-Bmat*mass_csi2*Cmat
Mass = speye(n)-Bmat*binv*Finv*Cmat; %mass matrix Bertaccini
% Con Bnl = I la mass Bertaccini si riduce a mass Elliott

   %Mt = Mass;    % M is provided by outer function
%end % End nested function mass
%--------------------------------------------------------------
%end
%fprintf('done!');