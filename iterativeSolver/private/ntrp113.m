function [yinterp,ypinterp] = ntrp113(tinterp,t,y,tnew,ynew,klast,phi,psi,idxNonNegative)
%NTRP113  Interpolation helper function for ODE113.
%   YINTERP = NTRP113(TINTERP,T,Y,TNEW,YNEW,KLAST,PHI,PSI,IDX) uses data computed
%   in ODE113 to approximate the solution at time TINTERP. TINTERP may be a
%   scalar or a row vector.  
%   [YINTERP,YPINTERP] = NTRP113(TINTERP,T,Y,TNEW,YNEW,KLAST,PHI,PSI,IDX) returns
%   also the derivative of the polynomial approximating the solution. 
%
%   IDX has indices of solution components that must be non-negative. Negative 
%   YINTERP(IDX) are replaced with zeros and the derivative YPINTERP(IDX) is 
%   set to zero.
%   
%   See also ODE113, DEVAL.

%   Mark W. Reichelt and Lawrence F. Shampine, 6-13-94
%   Copyright 1984-2005 The MathWorks, Inc.
%   $Revision: 1.11.4.4 $  $Date: 2005/04/18 22:11:48 $

yinterp = zeros(size(ynew,1),length(tinterp));
ypinterp = [];
if nargout > 1
  ypinterp = zeros(size(ynew,1),length(tinterp));
end  
ki = klast + 1;
KI = 1:ki;
hinterp = tinterp - tnew;            

for k = 1:length(tinterp)
  hi = hinterp(k);

  w = 1 ./ (1:13)';
  g = zeros(13,1);
  rho = zeros(13,1);
  g(1) = 1;
  rho(1) = 1;
  term = 0;
  for j = 2:ki
    gamma = (hi + term) / psi(j-1);
    eta = hi / psi(j-1);
    for i = 1:ki+1-j
      w(i) = gamma * w(i) - eta * w(i+1);
    end
    g(j) = w(1);
    rho(j) = gamma * rho(j-1);    
    term = psi(j-1);
  end  
  yinterp(:,k) = ynew + hi * phi(:,KI) * g(KI);
  if nargout > 1
    ypinterp(:,k) = phi(:,KI) * rho(KI);
  end  
end  

% Non-negative solution
if ~isempty(idxNonNegative)
  idx = find(yinterp(idxNonNegative,:)<0); % vectorized
  if ~isempty(idx)
    w = yinterp(idxNonNegative,:);
    w(idx) = 0;
    yinterp(idxNonNegative,:) = w;
    if nargout > 1   % the derivative
      w = ypinterp(idxNonNegative,:);
      w(idx) = 0;
      ypinterp(idxNonNegative,:) = w;
    end      
  end
end  
