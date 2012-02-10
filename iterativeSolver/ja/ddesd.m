% DDESD  一般的な遅延をもつ遅れ微分方程式 (DDE) の解法
%
%   SOL = DDESD(DDEFUN,DELAYS,HISTORY,TSPAN) は、DDE 
%   y'(t) = f(t,y(t),y(d(1)),...,y(d(k))) のシステムを積分します。遅延
%   d(j) は、t と y(t) に依存します。DDEFUN と DELAYS は、関数ハンドルです。
%   DELAYS(T,Y) は、遅延 d(j) の列ベクトルを返さなければなりません。DDESD は、
%   min(d(j),t) を使用することで、必要条件 d(j) <= t を保証します。関数 
%   DDEFUN(T,Y,Z) は、f(t,y(t),y(d(1)),...,y(d(k))) に対応する列ベクトルを
%   返さなければなりません。現在 t におけるスカラ T での DDEFUN と DELAYS 
%   への呼び出しにおいて、列ベクトル Y は y(t) を近似し、列 Z(:,j) は
%   DELAYS(T,Y) の要素 j として与えられた遅延 d(j) に対する y(d(j)) を
%   近似します。DDE は、T0 < TF と TSPAN = [T0 TF] の場合、TO から TF まで
%   積分されます。t <= T0 での解は、3 つの方法のいずれかによって HISTORY で
%   指定されます。HISTORY は関数ハンドルです。ここで、スカラ T に対して、
%   HISTORY(T) は、列ベクトル y(t) を返します。y(t) が定数の場合、HISTORY は
%   この列ベクトルになります。DDESD への呼び出しが T0 への前の積分に続く
%   場合、HISTORY は、呼び出しからの解 SOL になります。
%
%   DDESD は、[T0,TF] において連続の解を生成します。解は、DDESD の出力
%   SOL と関数 DEVAL: YINT = DEVAL(SOL,TINT) を使って点 TINT で実行され
%   ます。出力 SOL はつぎのようなもつ構造体です。
%       SOL.x  -- DDESD で選択したメッシュ
%       SOL.y  -- SOL.x のメッシュポイントで y(t) を近似
%       SOL.yp -- SOL.x のメッシュポイントで y'(t) を近似
%       SOL.solver -- 'ddesd'
%
%   SOL = DDESD(DDEFUN,DELAYS,HISTORY,TSPAN,OPTIONS) は、DDESET 関数で
%   作成された構造体 OPTIONS 内の値で置き換えられたデフォルトパラメータで
%   上述のように解を求めます。詳細については、DDESET を参照してください。
%   一般に用いられるオプションは、スカラの相対許容誤差 'RelTol' (デフォルトは 
%   1e-3) と、絶対許容誤差 'AbsTol' (デフォルトでは、すべての要素が 1e-6) の
%   ベクトルです。
%
%   解の初期値のデフォルトは、T0 での HISTORY で返される値です。異なる
%   初期値は、'InitialY' プロパティの値として与えることができます。
%
%   OPTIONS 内の 'Events' プロパティを関数ハンドル EVENTS に設定することで
%   DDESD は、上述のように解を求めて、イベント関数 
%   g(t,y(t),y(d(1)),...,y(d(k))) が 0 になるところも見つけます。各関数に
%   おいて、積分が 0 で終了する、またゼロクロッシングがどの方向になるかを
%   指定します。EVENTS: [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y,Z) は
%   3 つのベクトルを返します。I 番目のイベント関数 VALUE(I) は関数値です。
%   積分がこのイベント関数の 0 で終了する場合、ISTERMINAL(I) = 1 で、
%   そうでない場合は、0 になります。すべての 0 が計算された場合 (デフォルト)
%   は DIRECTION(I) = 0 で、イベント関数が増加したところのみ 0 の場合は +1、
%   イベント関数が減少したところのみ 0 の場合は -1 です。フィールド SOL.xe は、
%   イベントが発生した時点の行ベクトルです。SOL.ye の列は解に対応し、SOL.ie の
%   ベクトルは、イベントが発生した箇所を示します。
%
%   すべての遅延関数が d(j) = t - tau_j の形式をもつ場合、引数 DELAYS は、
%   定数ベクトル DELAYS(j) = tau_j に設定できます。この形式の遅延関数に
%   おいて、DDESD は、DDE23 のように正しく使われます。
%   
%   例 
%         sol = ddesd(@ddex1de,@ddex1delays,@ddex1hist,[0, 5]);
%     は、関数 ddex1delays で指定された遅延と、ddex1de で計算された
%     差分方程式をもつ区間 [0, 5] で DDE を求めます。この history は
%     関数 ddex1hist で t <= 0 に対して実行されます。
%     解は、[0 5] 内の 100 点の等間隔な点で実行されます。
%         tint = linspace(0,5);
%         yint = deval(sol,tint);
%     プロットするには、つぎのようにします。
%         plot(tint,yint);
%     この問題は、定数遅延を含みます。DDE23 のヘルプセクションと、例 DDEX1 
%     は、DDE23 を使ってこの問題をどのように解くのかを示します。
%     遅延微分方程式の例については、DDEX2 と DDEX3 を参照してください。
%
%   入力 TSPAN, HISTORY と、DELAYS(T,Y) の結果のクラスサポート:
%   and DDEFUN(T,Y,Z):
%     float: double, single
%
%   参考 DDE23, DDESET, DDEGET, DEVAL.


%   Copyright 1984-2006 The MathWorks, Inc.
