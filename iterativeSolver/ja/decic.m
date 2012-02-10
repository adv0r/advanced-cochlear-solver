%DECIC  ODE15I に対する矛盾のない初期条件を計算
%
% [Y0MOD,YP0MOD] = DECIC(ODEFUN,T0,Y0,FIXED_Y0,YP0,FIXED_YP0) は、
% ODEFUN(T0,Y0MOD,YP0MOD) = 0 を満たす出力値を見つけるための繰り返しに
% 初期の推定値として、入力 Y0,YP0 を使用します。ODEFUN は関数ハンドルです。
% T0 はスカラで、Y0 と YP0 は列ベクトルです。FIXED_Y0 と FIXED_YP0 は、
% 0 と 1 のベクトルです。DECIC は、推定の要素をできる限り変更しないように
% します。Y0(i) の推定に変更が許されていない場合、FIXED_Y0(i) = 1 と
% 設定することで、ある要素が固定されるように指定することができ、そうで
% ない場合、0 と指定します。FIXED_Y0 が空の配列の場合、すべての要素で
% 変更が可能であると解釈されます。FIXED_YP0 は、同様に扱われます。
%
% length(Y0) よりも多くの要素を固定することはできません。問題に依存して、
% 多くを固定できない可能性があります。Y0 または YP0 の特定の要素を固定
% できない可能性もあります。必要以上の要素を固定しないことをお勧めします。
% 
% [Y0MOD,YP0MOD] = DECIC(ODEFUN,T0,Y0,FIXED_Y0,YP0,FIXED_YP0,OPTIONS)
% は、ODESET 関数で作成された構造体、OPTIONS の値により置き換えられた
% 積分の許容誤差のデフォルト値を使用して上記のように計算します。
%
% [Y0MOD,YP0MOD,RESNRM] = DECIC(ODEFUN,T0,Y0,FIXED_Y0,YP0,FIXED_YP0...)
% は、ODEFUN(T0,Y0MOD,YP0MOD) のノルムを RESNRM として出力します。
% ノルムが大きすぎるようにみえる場合、OPTIONS を使用してより小さい 
% RelTol (デフォルトは 1e-3) を指定してください。
%
%
% 参考 ODE15I, ODESET, IHB1DAE, IBURGERSODE, FUNCTION_HANDLE.


% Copyright 1984-2006 The MathWorks, Inc.
