% ODEPRINT  コマンドウィンドウへの印刷 ODE 出力関数
%
% 関数 odeprint が、'OutputFcn' プロパティとして ODE ソルバに渡されるとき、
% すなわち、options = odeset('OutputFcn',@odeprint) のとき、ソルバは各時間
% ステップの後で、ODEODEPRINT(T,Y,'') を呼び出します。関数 ODEPRINT は、
% 計算の実行中に渡された解のすべての要素を印刷します。特定の要素のみを
% 印刷するためには、ODE ソルバに渡される 'OutputSel' プロパティにインデックス
% を指定してください。
%   
% 積分の開始時に、ソルバは出力関数を初期化するために、
% ODEPRINT(TSPAN,Y0,'init') を呼び出します。解のベクトルが Y である新しい
% 時間点 T への積分ステップの後で、ソルバは、STATUS = ODEPRINT(T,Y,'')
% を呼び出します。ソルバの 'Refine' プロパティが 1 より大きい場合 (ODESET
% を参照) は、T はすべての新しい出力時間を含む列ベクトルで、Y は対応する
% 列ベクトルからなる配列です。ODEPRINT は、常に STATUS = 0 を出力します。 
% 積分が終了すると、ソルバは ODEPRINT([],[],'done') を呼び出します。
%
% 参考 ： ODEPLOT, ODEPHAS2, ODEPHAS3, ODE45, ODE15S, ODESET.


%   Copyright 1984-2006 The MathWorks, Inc.
