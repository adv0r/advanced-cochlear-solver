% QUAD   数値積分、適応 Simpson 求積
%
%   Q = QUAD(FUN,A,B) は、適応リカーシブな Simpson 求積法を使って、1.e-6 
%   の誤差以内で、A から B までのスカラ値の関数 FUN の積分を近似しようと
%   します。FUN は関数ハンドルです。関数 Y=FUN(X) は、ベクトルの引数 X を
%   受け入れ、X の各要素で実行した被積分関数のベクトルの結果 Y を返します。
%
%   Q = QUAD(FUN,A,B,TOL) は、デフォルトの 1.e-6 の代わりに絶対許容誤差 
%   TOL を使用します。TOL の値を大きくすると、関数の計算回数が減り、高速
%   になりますが、精度は低下します。MATLAB 5.3 の QUAD 関数は、信頼性の
%   低いアルゴリズムを利用しており、デフォルトの許容誤差は 1.e-3 でした。
%
%   Q = QUAD(FUN,A,B,TOL,TRACE) は、非零の TRACE もつ場合、繰り返しの間、
%   [fcnt a b-a Q] の値を表示します。TOL のデフォルト値を取得するには、
%   プレースホルダーとして [] を使用してください。
%
%   [Q,FCNT] = QUAD(...) は、関数の実行回数を返します。
%
%   ベクトル引数を使って計算できるように、FUN の定義の中で、配列演算子 .*, 
%   ./, .^ を使用してください。
%
%   注意 :
%   関数 QUADL は、高精度とスムーズな被積分関数により、より効率的な計算
%   になる可能性があります。
%   関数 QUADV は、配列値 FUN に対して QUAD をベクトル化します。
%
%   例:
%      Q = quad(@myfun,0,2);
%   ここで myfun.m は、つぎの M-ファイル関数です。
%      %-------------------%
%      function y = myfun(x)
%      y = 1./(x.^3-2*x-5);
%      %-------------------%
%
%   あるいは、定数のパラメータを使用します。
%      Q = quad(@(x)myfun2(x,5),0,2);
%   ここで、myfun2 は、つぎの M-ファイル関数です。
%      %----------------------%
%      function y = myfun2(x,c)
%      y = 1./(x.^3-2*x-c);
%      %----------------------%
%
%   入力 A, B と FUN の出力のクラスサポート: 
%      float: double, single
%
%   参考 QUADV, QUADL, DBLQUAD, TRIPLEQUAD, TRAPZ, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc. 
