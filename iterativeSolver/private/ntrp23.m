function [yinterp,ypinterp] = ntrp23(tinterp,t,y,tnew,ynew,h,f,idxNonNegative)
%NTRP23  Interpolation helper function for ODE23.
%   YINTERP = NTRP23(TINTERP,T,Y,TNEW,YNEW,H,F,IDX) uses data computed in ODE23
%   to approximate the solution at time TINTERP. TINTERP may be a scalar 
%   or a row vector.  
%   [YINTERP,YPINTERP] = NTRP23(TINTERP,T,Y,TNEW,YNEW,H,F,IDX) returns also the
%   derivative of the polynomial approximating the solution. 
% 
%   IDX has indices of solution components that must be non-negative. Negative 
%   YINTERP(IDX) are replaced with zeros and the derivative YPINTERP(IDX) is 
%   set to zero.
%   
%   See also ODE23, DEVAL.

%   Mark W. Reichelt and Lawrence F. Shampine, 6-13-94
%   Copyright 1984-2005 The MathWorks, Inc.
%   $Revision: 1.12.4.6 $  $Date: 2005/04/18 22:11:50 $

BI = [
    1       -4/3        5/9
    0       1       -2/3
    0       4/3     -8/9
    0       -1      1
    ];

s = (tinterp - t)/h;       
yinterp = y(:,ones(size(tinterp))) + f*(h*BI)*cumprod([s;s;s]);

ypinterp = [];
if nargout > 1
  ypinterp = f*BI*[ ones(size(s)); cumprod([2*s;3/2*s])];
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

