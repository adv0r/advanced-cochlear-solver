% DDE23  定数遅れをもつ遅れ微分方程式 (DDE) の解法
%
%   SOL = DDE23(DDEFUN,LAGS,HISTORY,TSPAN) は、DDE 
%   y'(t) = f(t,y(t),y(t - tau_1),...,y(t - tau_k)) のシステムを積分します。
%   定数の正の遅れ tau_1,...,tau_k は、ベクトル LAGS として入力されます。
%   DDEFUN は関数ハンドルです。関数 DDEFUN(T,Y,Z) は、
%   f(t,y(t),y(t - tau_1),...,y(t - tau_k)) に対応する列ベクトルを出力
%   しなければなりません。DDEFUN への呼び出しにおいて、スカラ T は、現在の 
%   t で、列ベクトル Y は y(t) を近似し、遅れ tau_j = LAGS(J) に対して、
%   列 Z(:,j) は y(t - tau_j) を近似します。DDE は、T0 < TF で 
%   TSPAN = [T0 TF] の場合、T0 から TF に積分されます。t <= T0 での解は、
%   3種類のいずれかの方法で HISTORY で指定されます。HISTORY は、関数
%   ハンドルで、ここでスカラ T の場合、HISTORY(T) は列ベクトル y(t) を
%   出力します。y(t) が定数の場合、HISTORY はこの列ベクトルです。DDE23 への
%   この呼び出しが前の T0 の積分を続ける場合、HISTORY はその呼び出しの解 
%   SOL になります。
%
%   DDE23は、[T0,TF] で連続な解を生成します。解は、DDE23 の出力 SOL と
%   関数 DEVAL: YINT = DEVAL(SOL,TINT) を使って点 TINT において評価されます。
%   出力 SOL は、つぎの要素をもつ構造体です。
%       SOL.x  -- DDE23 により選択されたメッシュ
%       SOL.y  -- SOLx のメッシュ点における y(t) の近似
%       SOL.yp -- SOLx のメッシュ点における y'(t) の近似
%       SOL.solver -- 'dde23'
%
%   SOL = DDE23(DDEFUN,LAGS,HISTORY,TSPAN,OPTIONS) は、デフォルトの
%   パラメータを関数 DDESET によって作成された構造体 OPTIONS 内の値で
%   置き換えて、上記を解きます。詳細は、DDESET を参照してください。一般に
%   使用されるオプションは、スカラの相対許容誤差 'RelTol' (デフォルトでは
%   1e-3) と、絶対許容誤差ベクトル 'AbsTol' (デフォルトではすべての要素が
%   1e-6) です。
%
%   DDE23は、T0 (history) よりも前の解の不連続や、T0 の後での t の既知の
%   値での方程式の係数の不連続が、これらの不連続の位置が 'Jumps' オプション
%   の値としてベクトルに与えられている場合にこれらの問題を解くことができます。 
%
%   デフォルトでは、解の初期値は、T0 において HISTORY により出力される値です。
%   'InitialY' プロパティの値によっては、異なる初期値が与えられる場合があります。
%
%   OPTIONS の 'Events' プロパティに関数ハンドル EVENTS が設定されている
%   場合、DDE23 は上記のように解き、イベント関数 
%   g(t,y(t),y(t - tau_1),...,y(t - tau_k)) が 0 となる点を求めます。
%   指定する各関数に対して、積分が 0 で終了するかどうか、また、
%   ゼロクロッシングの方向に意味があるか指定します。これらは、
%   EVENTS: [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y,Z) で出力される 
%   3 つのベクトルです。I 番目のイベント関数に対して、VALUE(I) は、
%   関数値です。積分がこのイベント関数の 0 で終了する場合、ISTERMINAL(I) = 1 
%   で、そうでない場合は 0 です。すべての 0 が計算される (デフォルト) 
%   場合、DIRECTION(I) = 0 で、イベント関数が増加した点のみ 0 になる
%   場合は 1 で、イベント関数が減少した点のみ 0 になる場合は -1 です。
%   フィールド SOL.xe は、イベントが発生する時間の行ベクトルです。SOL.ye の
%   行は対応する解で、ベクトル SOL.ie は、どのイベントが発生したかを指定
%   するインデックスです。
%   
%   例    
%         sol = dde23(@ddex1de,[1, 0.2],@ddex1hist,[0, 5]);
%     は、区間 [0, 5] において遅れが 1 および 0.2 で、関数 ddex1de で
%     計算される遅れ微分方程式を解きます。history は、関数 ddex1hist で
%     t <= 0 に対して計算されます。解は [0 5] の 100 個の等間隔な点に
%     おいて計算されます。 
%         tint = linspace(0,5);
%         yint = deval(sol,tint);
%     以下によってプロットします。
%         plot(tint,yint);
%     DDEX1 は、サブ関数を使ったこの問題がどのようにコード化されるかを
%     示します。他の例については、DDEX2 を参照してください。  
%
%   入力 TSPAN, LAGS, HISTORY と DDEFUN(T,Y,Z) の結果のクラスサポート:
%     float: double, single
%   
% 参考 ： DDESET, DDEGET, DEVAL.


%   Copyright 1984-2006 The MathWorks, Inc.
