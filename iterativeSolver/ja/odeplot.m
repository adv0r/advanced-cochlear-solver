% ODEPLOT   ODE 出力関数
%
% 関数 'odeplot' が、'OutputFcn' プロパティとして ODE ソルバに渡されるとき、
% すなわち、options = odeset('OutputFcn',@odeplot) のとき、ソルバは時間
% ステップ毎に、ODEPLOODEPLOT(T,Y,'') を呼び出します。関数 ODEPLOT は、
% 計算の実行中に渡された解のすべての要素を、プロットの軸の範囲をダイナミック
% に調節して、プロットします。特定の要素のみをプロットするには、ODE ソルバに
% 渡される 'OutputSel' プロパティにインデックスを指定してください。ODEPLOT は、
% 出力引数なしでは、ソルバのデフォルトの出力関数です。
%   
% 積分の開始時に、ソルバは出力関数を初期化するために、
% ODEPLOT(TSPAN,Y0,'init') を呼び出します。解のベクトルが Y である時間点 
% T への積分ステップの後で、ソルバは、STATUS = ODEPLOT(T,Y,'') を呼び
% 出します。ソルバの 'Refine' プロパティが 1 より大きい場合 (ODESET を
% 参照) は、T はすべての新しい出力時間を含む列ベクトルで、Y は対応する
% 列ベクトルからなる配列です。STOP ボタンが押されていれば STATUS の出力値は 
% 1 で、そうでなければ 0 です。積分が終了すると、ソルバは ODEPLOT([],[],'done') 
% を呼び出します。
%   
% 参考 ： ODEPHAS2, ODEPHAS3, ODEPRINT, ODE45, ODE15S, ODESET.


%   Copyright 1984-2006 The MathWorks, Inc.
