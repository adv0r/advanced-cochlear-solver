function fcn = vectorize(fcn)
%VECTORIZE Vectorize an INLINE function object.
%   VECTORIZE(FCN) inserts a '.' before any '^', '*' or '/' in the formula
%   for FCN.  The result is the vectorized version of the INLINE function.
%
%   See also INLINE/FORMULA, INLINE.

%   Copyright 1984-2002 The MathWorks, Inc. 
%   $Revision: 1.6.4.1 $  $Date: 2007/06/14 05:08:56 $

fcn.expr = vectorize(fcn.expr);
