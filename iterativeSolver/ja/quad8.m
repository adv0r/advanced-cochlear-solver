% QUAD8  高次の数値積分
%
%   QUAD8 は、古い関数です。代わりに QUADL 使用してください。
%
%   Q = QUAD8(FUN,A,B) は、適応リカーシブな Newton Cotes 8 panel 法を
%   使って、1e-3 の相対誤差以内で、A から B までのスカラ値の関数 FUN の
%   積分を近似します。FUN は関数ハンドルです。関数 Y=FUN(X) は、ベクトルの
%   入力 X を受け入れ、X の各要素で評価された関数 FUN となるベクトル Y を
%   返します。
%   特異点の積分を示すリカーションレベルに達すると、Q = Inf が出力されます。
%
%   Q = QUAD8(FUN,A,B,TOL) は、相対誤差が TOL になるように積分します。
%   2 要素の許容誤差 TOL = [rel_tol abs_tol] を使って、相対誤差と絶対誤差
%   を指定します。
%
%   Q = QUAD8(FUN,A,B,TOL,TRACE) は、相対誤差が TOL になるまで積分します。
%   0 でない TRACE に対して、積分点のプロットを行い関数の実行を表示します。
%   TOL のデフォルト値を得るにはプレースホルダーとして [] を使用してください。
%
%   参考  QUADL, QUAD, QUADV, DBLQUAD, TRIPLEQUAD, TRAPZ, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc.
