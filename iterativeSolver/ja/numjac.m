% NUMJAC 関数 F(T,Y)の ヤコビアン dF/dY を数値的に計算
%
%   [DFDY,FAC] = NUMJAC(F,T,Y,FTY,THRESH,FAC,VECTORIZED) は、関数 F(T,Y) の
%   ヤコビアンを数値的に計算し、フル行列 DFDY として結果を返します。F は、
%   関数ハンドルです。スカラ T と列ベクトル Y に対して、F(T,Y) は、列
%   ベクトルを返さなければなりません。T は独立変数で、Y は従属変数を
%   含みます。ベクトル FTY は、(T,Y) で評価された F です。列ベクトル 
%   THRESH は、Y に対する有意性のしきい値を与えます。すなわち、
%   abs(Y(i)) < THRESH(i) をもつ要素 Y(i) の正確な値は重要ではありません。
%   THRESH のすべての要素は、正でなければなりません。列 FAC は、作業領域です。
%   最初の呼び出しで、FAC を [] に設定します。呼び出しの間で戻り値を変更
%   しません。VECTORIZED は、NUMJAC に、F の複数の値が単一関数の計算で
%   得られるか否かを伝えるものです。特に、VECTORIZED=1 は、F(t,[y1 y2 ...]) が 
%   [F(t,y1) F(t,y2) ...] を戻し、VECTORIZED=2 は、F([x1 x2 ...] ,[y1 y2 ...]) 
%   が [F(x1,y1) F(x2,y2) ...] を戻すことを示します。ODE 問題を解くとき、
%   ODE 関数で、F(t,[y1 y2 ...]) が [F(t,y1) F(t,y2) ...] を出力するように
%   コード化されている場合、ODESET を使って、ODE ソルバ 'Vectorized' 
%   プロパティを 'on' に設定します。BVP 問題を解くとき、ODE 関数で、
%   F([x1 x2 ...],[y1 y2 ...]) が [F(x1,y1) F(x2,y2) ...] を出力するように
%   コード化されている場合、BVPSET を使って BVP ソルバの 'Vectorized' 
%   プロパティを 'on' に設定します。関数 F をベクトル化することで、DFDY の
%   計算のスピードが上がる可能性があります。
%   
%   [DFDY,FAC,G] = NUMJAC(F,T,Y,FTY,THRESH,FAC,VECTORIZED,S,G) は、
%   スパースヤコビ行列 DFDY を数値的に計算します。S は、0 と 1 から構成
%   される空でないスパース行列です。S(i,j) の中の 0 の値は、関数 F(T,Y) の
%   i 成分が、ベクトル Y の j 成分に依存していないことを示します (すなわち、
%   DFDY(i,j)=0 です)。列ベクトル G は、作業領域です。最初の呼び出しでは、
%   G を [] に設定してください。呼び出しの間、戻り値を変更しないでください。
%   
%   [DFDY,FAC,G,NFEVALS,NFCALLS] = NUMJAC(...) は、dFdy (NFEVALS) と
%   関数 F (NFCALLS) への呼び出し回数を作成する間に値 F(T,Y) の数を出力
%   します。F がベクトル化されない場合、NFCALLS はNFEVALS と等しくなります。
%
%   ODE 問題を積分する場合、偏微分係数の近似に対して、NUMJAC は特別に
%   開発されていますが、他のアプリケーションにも使うことができます。
%   特に、F(T,Y) で戻されるベクトルの長さが Y の長さと異なる場合、DFDY は
%   長方形になります。
%   
% 参考 COLGROUP, ODE15S, ODE23S, ODE23T, ODE23TB, ODESET.


%   Copyright 1984-2006 The MathWorks, Inc.
