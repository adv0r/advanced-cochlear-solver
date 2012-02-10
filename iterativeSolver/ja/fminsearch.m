% FMINSEARCH 多次元の制約ないの非線形最小化 (Nelder-Mead 法）
%
% X = FMINSEARCH(FUN,X0) は、X0 で始まり、関数 FUN の局所的な最小点 X を
% 見つけようとします。FUN は関数ハンドルです。FUN は、入力 X を受け入れ、
% X で計算したスカラの関数値 F を出力します。X0 は、スカラ、ベクトル、
% 行列になります。
%
% X = FMINSEARCH(FUN,X0,OPTIONS) は、デフォルトの最適パラメータの代わりに、
% OPTIMESET 関数で作成された OPTIONS 構造体の値を使って最小化を行います。
% 詳しくは、OPTIMSET を参照してください。FMINSEARCH は、オプション Display, 
% TolX, TolFun, MaxFunEvals, MaxIter, FunValCheck, OutputFcn を使用します。 
%
% [X,FVAL] =  FMINSEARCH(...) は、値 X での目的関数 FUN の値を出力します。
%
% [X,FVAL,EXITFLAG] = FMINSEARCH(...) は、FMINSEARCH の終了状態を記述する
% EXITFLAG を出力します。EXITFLAG の可能な値と対応する終了条件は、つぎの
%  ようになります。
%
%     1 FMINSEARCH は解 X で収束したことを示します。
%   　0 関数評価、または、繰り返しの最大数に到達したことを示します。
%    -1 アルゴリズムが出力関数で終了したことを示します。
%
% [X,FVAL,EXITFLAG,OUTPUT] = FMINSEARCH(...) は、OUTPUT.iterations の中の
% 繰り返し回数、OUTPUT.funcCount の中の関数評価の数、OUTPUT.algorithm の
% 中のアルゴリズム名、OUTPUT.message の中の終了メッセージを含んだ構造体
% OUTPUT も出力します。
%
% 例
% FUN は、@ を使って、設定することができます。
%        X = fminsearch(@sin,3)
% は、値 3 の近傍で、SIN の最小値を求めます。この場合、SIN は、X での
% スカラの関数値 SIN も出力します。
%
% FUN は、無名関数を使って、設定することができます。
%        X = fminsearch(@(x) norm(x),[1;2;3])
% は、 [0;0;0] の近傍で最小値を出力します。
%
% FUN がパラメータ化された場合、問題依存のパラメータを捉えるために、
% 無名関数を使用できます。myfun に与えられた目的関数を最適化するものと
% 仮定し、2 番目の引数 c でパラメータ化します。ここで、myfun は、つぎの
% ような M-ファイルです。
%
%     function f = myfun(x,c)
%     f = x(1)^2 + c*x(2)^2;
%
% 特定の c 値に対して最適化するには、最初に c に値を割り当てます。その後、
% c の値を捉える 1 つの引数をもつ無名関数を作成し、2 つの引数をもつ
% 無名関数を呼び出します。最後に、この無名関数を FMINBND に渡します。
% 
%     c = 1.5; % パラメータを最初に定義
%     x = fminsearch(@(x) myfun(x,c),[0.3;1])
%
% FMINSEARCH は、Nelder-Mead シンプレックス (直接) 法を使っています。
%
% 参考 OPTIMSET, FMINBND, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc.
