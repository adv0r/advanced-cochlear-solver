% TRIPLEQUAD    数値的な三重積分の計算
%
%   Q = TRIPLEQUAD(FUN,XMIN,XMAX,YMIN,YMAX,ZMIN,ZMAX) は、3 次元長方形
%   領域 XMIN <= X <= XMAX, YMIN <= Y <= YMAX, ZMIN <= Z <= ZMAX 上で、
%   FUN(X,Y,Z) の三重積分を計算します。FUN は関数ハンドルです。
%   FUN(X,Y,Z) は、ベクトル X とスカラ Y, Z を受け入れ、被積分関数の値の
%   ベクトルを返す必要があります。
%
%   Q = TRIPLEQUAD(FUN,XMIN,XMAX,YMIN,YMAX,ZMIN,ZMAX,TOL) は、デフォルトの 
%   1.e-6 の代わりに許容誤差 TOL を使用します。
%
%   Q = TRIPLEQUAD(FUN,XMIN,XMAX,YMIN,YMAX,ZMIN,ZMAX,TOL,@QUADL) は、
%   デフォルトの QUAD の代わりに求積関数 QUADL を使用します。
%   Q = TRIPLEQUAD(FUN,XMIN,XMAX,YMIN,YMAX,ZMIN,ZMAX,TOL,MYQUADF) は、
%   QUAD の代わりにユーザ定義の求積関数 MYQUADF を使用します。MYQUADF は、
%   QUAD および QUADL と同じ呼び出しシーケンスをもつ必要があります。
%   TOL のデフォルト値を得るには、プレースホルダーとして [] を使用して
%   ください。
%
%   例 :
%   領域 0 <= x <= pi, 0 <= y <= 1, -1 <= z <= 1 で積分します。
%      Q = triplequad(@(x,y,z) (y*sin(x)+z*cos(x)), 0, pi, 0, 1, -1, 1)
%   または、
%      Q = triplequad(@integrnd, 0, pi, 0, 1, -1, 1)
%   ここで、被積分関数は、つぎの M-ファイル関数です。
%       %----------------------------%
%       function f = integrnd(x, y, z)
%       f = y*sin(x)+z*cos(x);  
%       %----------------------------%
%
%   被積分関数は、ベクトル x とスカラ y, z で実行されることに注意してください。
%
%   入力 XMIN,XMAX,YMIN,YMAX,ZMIN,ZMAX と FUN の出力のクラスサポート :
%      float: double, single
%
%   参考 QUAD, QUADL, DBLQUAD, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc.
