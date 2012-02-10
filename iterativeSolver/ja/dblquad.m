% DBLQUAD  2 重積分を数値的に実行
%
%   Q = DBLQUAD(FUN,XMIN,XMAX,YMIN,YMAX) は、長方形区間 XMIN <= X <= XMAX, 
%   YMIN <= Y <= YMAX で、FUN(X,Y) の 2 重積分を実行します。FUN は関数
%   ハンドルです。関数 Z=FUN(X,Y) は、ベクトル X とスカラ Y を受け入れ、
%   積分値のベクトル Z を返します。
%
%   Q = DBLQUAD(FUN,XMIN,XMAX,YMIN,YMAX,TOL) は、デフォルトの許容誤差 
%   1.e-6 の代わりに、TOL を使用します。
%
%   Q = DBLQUAD(FUN,XMIN,XMAX,YMIN,YMAX,TOL,@QUADL) は、デフォルトの 
%   QUAD の代わりに、求積関数 QUADL を使用します。
%   Q = DBLQUAD(FUN,XMIN,XMAX,YMIN,YMAX,TOL,MYQUADF) は、QUAD の代わりに
%   ユーザ自身の求積関数 MYQUADF を使用します。MYQUADFは関数ハンドルです。
%   MYQUADF は、QUAD と QUADL と同じシーケンスの呼び出しをもつ必要があり
%   ます。TOL のデフォルト値を得るには、プレースホルダーとして [] を
%   使用してください。
%
%   例 ：
%   pi <= x <= 2*pi, 0 <= y <= pi の正方を積分するには、
%      Q = dblquad(@(x,y)y*sin(x)+x*cos(y), pi, 2*pi, 0, pi) 
%   と記述するか、または、
%      Q = dblquad(@integrnd, pi, 2*pi, 0, pi)
%   とします。ここで、integrnd.m は、つぎのようなM-ファイルです。       
%      %-------------------------% 
%      function z = integrnd(x, y)
%      z = y*sin(x)+x*cos(y);  
%      %-------------------------% 
%
%   integrand は、ベクトル x とスカラ y で実行されることに注意してください。
%
%   正方でない領域は、integrand の領域の外側に 0 を設定することで扱います。
%   半球の体積は、つぎのように求まります。
%      V = dblquad(@(x,y) sqrt(max(1-(x.^2+y.^2),0)),-1,1,-1,1)
%   または
%      V = dblquad(@(x,y) sqrt(1-(x.^2+y.^2)).*(x.^2+y.^2<=1),-1,1,-1,1)
%
%   入力 XMIN,XMAX,YMIN,YMAX と FUN の出力のクラスサポート:
%      float: double, single
% 
%   参考 QUAD, QUADL, TRIPLEQUAD, TRAPZ, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc.
