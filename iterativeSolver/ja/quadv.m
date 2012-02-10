% QUADV  ベクトル化された QUAD
%
%   Q = QUADV(FUN,A,B) は、再帰的な適応 Simpson 求積法を使って 1.e-6 の
%   誤差以内になるように複素数の配列の値の関数 FUN を A から B まで近似します。
%   FUN は関数ハンドルです。 関数 Y=FUN(X) は、スカラの引数 X を受け入れ、
%   X で計算された被積分関数である結果の配列 Y を返します。
%
%   Q = QUADV(FUN,A,B,TOL) は、デフォルトである 1.e-6 の代わりに絶対許容
%   誤差 TOL を使用します。
%
%   Q = QUADV(FUN,A,B,TOL,TRACE) は、TRACE が 0 でない場合は、再帰呼び出し中に
%   [fcnt a b-a Q(1)] の値を示します。 TOL のデフォルトの値を使うためには
%   代わりに [] を使用してください。
%
%   [Q,FCNT] = QUADV(...) は、関数の計算回数を出力します。
%
%   注意: 同じ許容誤差がすべての成分に対して使用されます。 そのため、
%   個々の成分について QUADV で得られた結果と QUAD で得られたものは通常
%   同じではありません。
%
%   例:
%   パラメータ化された配列の値の関数 myarrayfun に対して、
%      %--------------------------%
%      function Y = myarrayfun(x,n)
%      Y = 1./((1:n)+x);
%      %--------------------------%
%   つぎのシンタックスは、a=0 から b=1 までをパラメータ値 n=10 を使って
%   積分します。
%      Qv = quadv(@(x)myarrayfun(x,10),0,1);
%   結果の配列 Qv は、Q(k) = log((k+1)./(k)) で推定される要素をもちます。
%   ループ内に QUAD を使用して計算される場合と Qv はわずかに異なります。
%      for k = 1:10
%         Qs(k) = quad(@(x)myscalarfun(x,k),0,1);
%      end
%   ここで myscalarfun はつぎの通りです。
%      %---------------------------%
%      function y = myscalarfun(x,k)
%      y = 1./(k+x);
%      %---------------------------%
%
%   入力 A, B と FUN の出力に対するクラスサポートはつぎの通りです。
%      float: double, single
%
%   参考 QUAD, DBLQUAD, TRIPLEQUAD, FUNCTION_HANDLE.


%   Copyright 1984-2005 The MathWorks, Inc. 
