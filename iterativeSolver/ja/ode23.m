% ODE23  低次法によるノンスティッフ微分方程式の解法
%
%   [TOUT,YOUT] = ODE23(ODEFUN,TSPAN,Y0) 但し TSPAN = [T0 TFINAL] は、
%   T0 と TFINAL 間の任意の点において、初期条件 Y0 で時間 T0 から TFINAL 
%   まで微分方程式 (システム) y' = f(t,y) を積分します。 関数 ODEFUN は
%   関数ハンドルです。 スカラ T とベクトル Y に対して、ODEFUN(T,Y) は 
%   f(t,y) に対応する列ベクトルを返さなければなりません。 解の配列 YOUT 
%   の各行は、列ベクトル TOUT に返される時間に対応します。 時間 
%   T0,T1,...TFINAL (単調増加または単調減少) での解を求めるためには、
%   TSPAN = [T0 T1 ... TFINAL] を使用してください。
%   
%   [TOUT,YOUT] = ODE23(ODEFUN,TSPAN,Y0,OPTIONS) は、デフォルトの積分
%   パラメータを OPTIONS の値で置き換えて解きます。 OPTIONS は、関数 
%   ODESET で作成された引数です。 詳細は、関数 ODESET を参照してください。
%   共通に使用されるオプションは、スカラの相対許容誤差 'RelTol' (デフォルト
%   では 1e-3) と、絶対許容誤差ベクトル 'AbsTol' (デフォルトでは 1e-6) 
%   です。 解の一部の成分が、非負でなければなない場合、その成分のインデックス
%   に対して 'NonNegative' プロパティを設定するために ODESET を使用してください。
%   
%   ODE23 は、正則な質量行列 M をもつ M(t,y)*y' = f(t,y) を解くことが
%   できます。 MASS(T,Y) が質量行列の値を出力する場合は、ODESET を使って
%   関数ハンドル MASS に 'Mass' プロパティを設定します。 質量行列が定数の
%   場合、行列は、'Mass' プロパティの値として利用されます。 質量行列が
%   状態変数 Y に依存せず、関数 MASS が入力引数 T と共に呼び出される場合は、
%   'MStateDependence' を 'none' に設定してください。 ODE15S と ODE23T は、
%   特異な質量行列を含む問題を解くことができます。
%
%   [TOUT,YOUT,TE,YE,IE] = ODE23(ODEFUN,TSPAN,Y0,OPTIONS) は、OPTIONS の
%   'Events' プロパティが関数ハンドル EVENTS に設定されている場合の解法で
%   イベント関数と呼ばれる (T,Y) の関数が 0 となる点を求めます。 各関数に
%   対して、積分が 0 で終了するかどうか、そしてゼロクロッシングの方向が
%   重要かどうか指定する必要があります。 これらは、EVENTS: 
%   [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y) によって返される 3 つの
%   ベクトルです。 各 I 番目のイベント関数に対して、VALUE(I) は、関数の
%   値を表します。 積分がこのイベント関数の 0 で終了する場合は、
%   ISTERMINAL(I)=1 となり、そうでない場合は ISTERMINAL(I)=0 となります。 
%   すべての 0 が計算される (デフォルト) 場合は、DIRECTION(I)=0 で、
%   イベント関数が増加した点のみ 0 である場合は +1 で、イベント関数が
%   減少した点のみ 0 である場合は -1 です。 出力 TE は、イベントの発生
%   時間の列ベクトルです。 YE の行は対応する解で、
%   ベクトル IE のインデックスはどのイベントが発生したかを示しています。
%
%   SOL = ODE23(ODEFUN,[T0 TFINAL],Y0...) は、T0 と TFINAL 間の任意の
%   点における解、または1次導関数を計算するため、DEVAL で使用可能な構造体を
%   出力します。 ODE23 で選択されたステップは、行ベクトル SOL.x に出力
%   されます。 各 I に対して、列 SOL.y(:,I) は、SOL.x(I) での解を含んで
%   います。 イベントが検出された場合、SOL.xe は、イベントが発生した位置を
%   示す点で構成される行ベクトルになります。 SOL.ye の列ベクトルは、解に
%   対応し、ベクトル SOL.ie の中のインデックスは、どのイベントが発生した
%   かを示します。
%
%   例    
%         [t,y]=ode23(@vdp1,[0 20],[2 0]);   
%         plot(t,y(:,1));
%     は、デフォルトの相対誤差 1e-3 とデフォルトの絶対誤差 1e-6 を各成分に
%     使ってシステムy' = vdp1(t,y) を解き、解の最初の要素をプロットします。
% 
%     入力 TSPAN、Y0、ODEFUN(T,Y) の出力に対するクラスサポート:
%
%   参考
%       他のODEソルバ:      ODE45, ODE113, ODE15S, ODE23S, ODE23T, ODE23TB
%       陰的 ODE     :      ODE15I
%       options の取り扱い: ODESET, ODEGET
%       出力関数     :      ODEPLOT, ODEPHAS2, ODEPHAS3, ODEPRINT
%       解の計算     :      DEVAL
%       ODE 例       :      RIGIDODE, BALLODE, ORBITODE
%       関数ハンドル :      FUNCTION_HANDLE 
%
%   注意: 
%     ODE ソルバの最初の入力引数と ODESET へ渡すいくつかのプロパティの
%     解釈は、MATLAB 6.0 で変更されています。 
%     バージョン 5 のシンタックスは現在、サポートしていますが、新しい
%     機能は、新しいシンタックスでのみ使用可能です。バージョン 5 のヘルプを
%     見るには、つぎのように入力してください。
%         more on, type ode23, more off


%   Mark W. Reichelt and Lawrence F. Shampine, 6-14-94
%   Copyright 1984-2005 The MathWorks, Inc.
