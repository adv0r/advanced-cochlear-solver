% ODEPHAS2  2 次元位相平面の ODE 出力関数
% 
% 関数 odephas2 が 'OutputFcn' プロパティとして ODE ソルバに渡されるとき、
% すなわち、options = odeset('OutputFcn',@odephas2) の場合、ソルバは各時間
% ステップ毎に、ODEPHAS2(T,Y,'') を呼び出します。関数 ODEPHAS2 は、計算
% された通りに渡される解の最初の 2 つの要素を、軸の範囲にダイナミックに
% 調節しながらプロットします。特定の 2 つの要素をプロットするには、ODE 
% ソルバに渡される 'OutputSel' プロパティにインデックスを指定してください。
%   
% 積分の開始時に、ソルバは出力関数を初期化するために、
% ODEPHAS2(TSPAN,Y0,'init') を呼び出します。解のベクトルが Y である新しい
% 時間点への積分ステップの後で、ソルバは STATUS = ODEPHAS2(T,Y,'') を
% 呼び出します。ソルバの 'Refine' プロパティが1より大きい場合 (ODESET を
% 参照) は、T はすべての新しい出力時間を含む列ベクトルで、Y は対応する
% 列ベクトルからなる配列です。STOP ボタンが押されていれば STATUS の出力値は
% 1 で、そうでなければ 0 です。積分が終了すると、ソルバは 
% ODEPHAS2([],[],'done') を呼び出します。
%
%   
% 参考 ： ODEPLOT, ODEPHAS3, ODEPRINT, ODE45, ODE15S, ODESET.


%   Copyright 1984-2006 The MathWorks, Inc.
