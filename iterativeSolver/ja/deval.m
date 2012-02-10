% DEVAL  微分方程式問題の解を計算します
%
% SXINT = DEVAL(SOL,XINT) は、ベクトル XINT のすべての要素に対する
% 微分方程式問題の解を解きます。SOL は、初期値問題ソルバ (ODE45, ODE23, 
% ODE113, ODE15S, ODE23S, ODE23T, ODE23TB, ODE15I)、境界値問題ソルバ 
% (BVP4C)、または遅れ微分方程式ソルバ (DDE23, DDESD) で出力される構造体
% です。XINT の要素は、区間 [SOl.x(1) SOL.x(end)] 内になければなりません。
% 各 I に対して、SXINT(:,I) は、XINT(I) に対応する解です。 
%
% SXINT = DEVAL(SOL,XINT,IDX) は、上記のように実行しますが、IDX にリスト
% されたインデックスをもつ解の要素のみを出力します。   
%
% SXINT = DEVAL(XINT,SOL) と SXINT = DEVAL(XINT,SOL,IDX) も利用できます。
%
% [SXINT,SPXINT] = DEVAL(...) は、上記のように評価しますが、解を補間する
% 多項式の 1 階導関数の値も出力します。
%
% ODEXTEND を使用して拡張した多点境界値問題、または初期値問題に対して、
% 解は、境界で不連続である可能性があります。境界点 XC に対して、DEVAL は、
% XC の左と右からの極限の平均を出力します。極限値を得るには、DEVAL の
% 引数 XINT を XC よりもわずかに小さく、あるいは、わずかに大きく設定して
% ください。
%
% 入力 SOL と XINT のクラスサポート:
%     float: double, single
%
% 参考 
%    ODE ソルバ:  ODE45, ODE23, ODE113, ODE15S, 
%                 ODE23S, ODE23T, ODE23TB, ODE15I 
%    DDE ソルバ:  DDE23, DDESD
%    BVP ソルバ:  BVP4C


%   Copyright 1984-2006 The MathWorks, Inc.
