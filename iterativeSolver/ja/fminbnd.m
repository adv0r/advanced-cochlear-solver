%  FMINBND スカラで範囲の制約を付けた非線形関数の最小化
%
%  X = FMINBND(FUN,x1,x2) は、x1 < X < x2 の範囲で、関数 FUN の局所的な
%  最小値 X を見つけようとします。FUN は関数ハンドルです。FUN は、スカラの
%  入力 X を受け入れ、X でのスカラの関数値 F を出力します。
%
%  X = FMINBND(FUN,x1,x2,OPTIONS) は、デフォルトの最適パラメータの代わり
%  に、OPTIMSET 関数で作成されたOPTIONS 構造体の値を使って最小化を行います。
%  詳しくは、OPTIMSET を参照してください。FMINBND は、つぎのオプション、
%  Display, TolX, MaxFunEval, MaxIter, FunValCheck, OutputFcn を使います。
%
%  [X,FVAL] = FMINBND(...)は、値 X での目的関数 FUN の値 FVAL を出力します。
%
%  [X,FVAL,EXITFLAG] = FMINBND(...) は、また、FMINBND の終了状態を記述する 
%  EXITFLAG を出力します。EXITFLAG の可能な値と対応する終了条件は、つぎの
%  ようになります。
%
%     1 FMINBND は、OPTIONS.TolFun をベースに解 X に収束したことを示します。
%     0 関数評価、または、繰り返しの最大数に到達したことを示します。
%    -1 アルゴリズムが出力関数で終了したことを示します。
%    -2 境界が矛盾 (すなわち、ax > bx) していることを示します。
%
%  [X,FVAL,EXITFLAG,OUTPUT] = FMINBND(...) は、OUTPUT.iterations の中の繰り
%  返し回数、OUTPUT.funcCount の中の関数評価の数、OUTPUT.algorithm の中の
%  アルゴリズム名、OUTPUT.message の中の終了メッセージを含んだ構造体
%  OUTPUT も出力します。
%
%  例
%  FUN は、@ を使って設定できます。
%        X = fminbnd(@cos,3,4)
% は、数桁まで pi を計算し、終了時にメッセージを表示します。
%  [X,FVAL,EXITFLAG] = fminbnd(@cos,3,4,optimset('TolX',1e-12,'Display','off'))
%  は、pi を 12 桁まで計算し、出力を表示しないで、x での関数値を出力し、
%  EXITFLAG に 1 を出力します。
%
% FUN は、無名関数でも設定できます。
%        x = fminbnd(@(x) sin(x)+3,2,5)
%
% FUN がパラメータ化された場合、問題依存のパラメータを捉えるために、
% 無名関数を使用できます。myfun に与えられた目的関数を最小化するものと
% 仮定し、2 番目の引数 c でパラメータ化します。ここで、myfun は、つぎの
% ような M-ファイルです。
%
%     function f = myfun(x,c)
%     f = (x - c)^2;
%
% 特定の c の値を最適化するには、最初に c に値を割り当てます。その後、
% c の値を捉える 1 つの引数をもつ無名関数を作成し、2 つの引数をもつ
% 無名関数を呼び出します。最後に、この無名関数を FMINBND に渡します。
% 
%     c = 1.5; % パラメータを最初に定義
%     x = fminbnd(@(x) myfun(x,c),0,1)
%
% 参考 OPTIMSET, FMINSEARCH, FZERO, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc.
