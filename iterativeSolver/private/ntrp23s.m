function [yinterp, ypinterp] = ntrp23s(tinterp,t,y,tnew,ynew,h,k1,k2)
%NTRP23S  Interpolation helper function for ODE23S.
%   YINTERP = NTRP23S(TINTERP,T,Y,TNEW,YNEW,H,K1,K2) uses data computed in
%   ODE23S to approximate the solution at time TINTERP. TINTERP may be 
%   a scalar or a row vector.     
%   [YINTERP,YPINTERP] = NTRP23S(TINTERP,T,Y,TNEW,YNEW,H,K1,K2) returns also
%   the derivative of the polynomial approximating the solution.  
%   
%   See also ODE23S, DEVAL.

%   Mark W. Reichelt and Lawrence F. Shampine, 6-13-94
%   Copyright 1984-2004 The MathWorks, Inc.
%   $Revision: 1.12.4.4 $  $Date: 2005/03/07 17:31:02 $

s = (tinterp - t)/h;     

d = 1 / (2 + sqrt(2));
e = h / (1 - 2*d);

p1 = (s .* (1 - s)) * e;
p2 = (s .* (s - 2*d)) * e;

yinterp = y(:,ones(size(tinterp))) + k1*p1 + k2*p2;
if nargout > 1
  dp1 = e/h*(1-2*s);
  dp2 = e/h*2*(s-d);
  ypinterp = k1*dp1 + k2*dp2;
end
