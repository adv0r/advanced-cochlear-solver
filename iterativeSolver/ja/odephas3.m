% ODEPHAS3   3 次元位相平面の ODE 出力関数
%
% 関数 odephas3 が 'OutputFcn' プロパティとして ODE ソルバに渡されるとき、
% すなわち、options = odeset('OutputFcn',@odephas3) のとき、ソルバは
% 各時間ステップ毎に ODEPHAS3(T,Y,'') を呼び出します。関数 ODEPHAS3 は、
% 計算された通りに渡される解の最初の 3 つの要素を、軸の範囲にダイナミック
% に調節しながらプロットします。特定の 3 つの要素をプロットするには、ODE 
% ソルバに渡される 'OutputSel' にインデックスを指定してください。
%   
% 積分の開始時に、ソルバは出力関数を初期化するために、
% ODEPHAS3(TSPAN,Y0,'init') を呼び出します。解のベクトルが Y である新しい
% 時間点への積分ステップの後で、ソルバは STATUS = ODEPHAS3(T,Y,'')
% を呼び出します。ソルバの 'Refine' プロパティが 1 より大きい場合 (ODESET を
% 参照) は、T はすべての新しい出力時間を含む列ベクトルで、Y は対応する
% 列ベクトルからなる配列です。STOP ボタンが押されていれば STATUS の出力値は 
% 1 で、そうでなければ 0 です。積分が終了すると、ソルバは 
% ODEPHAS3([],[],'done') を呼び出します。
%
% 参考 ： ODEPLOT, ODEPHAS2, ODEPRINT, ODE45, ODE15S, ODESET.


%   Copyright 1984-2006 The MathWorks, Inc.
