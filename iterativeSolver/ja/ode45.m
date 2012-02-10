% ODE45  中次の手法によるスティッフでない微分方程式の解法
%
%   [TOUT,YOUT] = ODE45(ODEFUN,TSPAN,Y0) は、T0 と TFINAL 間の任意の点に
%   おいて、初期状態 Y0 で時間 T0 から TFINAL まで微分方程式 (システム系)
%   y' = f(t,y) を積分します。 関数 ODEFUN は関数ハンドルです。 スカラ T 
%   とベクトル Y に対して、ODEFUN(T,Y) は f(t,y) に対応する列ベクトルを
%   返さなければなりません。 解の配列 YOUT の各行は、列ベクトル TOUT に
%   返される時間に対応します。 時間 T0,T1,...TFINAL (単調増加または単調
%   減少) での解を求めるためには、TSPAN = [T0 T1 ... TFINAL] を使用して
%   ください。
%   
%   [TOUT,YOUT] = ODE45(ODEFUN,TSPAN,Y0,OPTIONS) は、デフォルトの積分
%   プロパティを OPTIONS の値で置き換えて解きます。 OPTIONS は、関数 
%   ODESET で作成された引数です。 詳細は、ODESET を参照してください。
%   一般に使用されるオプションは、相対許容誤差のスカラ 'RelTol' (デフォルト
%   で 1e-3) と、絶対許容誤差のベクトル 'AbsTol' (すべての成分がデフォルト
%   で 1e-6) です。 一部の解の成分が、非負でなければなない場合、
%   'NonNegative' プロパティをこれらの成分のインデックスに設定するために 
%   ODESET を使用してください。
%   
%   ODE45 は、正則な質量行列 M(t,y) をもつ問題 M(t,y)*y' = f(t,y) を
%   解きます。 MASS(T,Y) が質量行列の値を出力する場合は、ODESET を使って
%   関数ハンドル MASS に 'Mass'プロパティを設定します。質量行列が定数の
%   場合は、行列は 'Mass' オプションの値として使われます。 質量行列が
%   状態変数 Y に依存せず、関数 MASS が1つの入力引数 T と共に呼び出される
%   場合は、'MStateDependence' を 'none' に設定してください。 ODE15S と 
%   ODE23T は、非正則な質量行列を含む問題を解くことができます。
%
%   [TOUT,YOUT,TE,YE,IE] = ODE45(ODEFUN,TSPAN,Y0,OPTIONS) は、OPTIONS の
%   'Events' プロパティが関数ハンドル EVENTS に設定されていると、上記の
%   ように解き、イベント関数と呼ばれる (T,Y) の関数が 0 となる点を求めます。
%   指定する各関数に対して、0 で積分が終了するかどうか、およびゼロ
%   クロッシングの方向は重要です。 これらは、EVENTS: 
%   [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y) によって返される 3 つの
%   ベクトルです。 I 番目のイベント関数に対して、VALUE(I) は、関数の値です。
%   このイベント関数で関数の値が 0 になり積分を終了する場合、ISTERMINAL(I)=1 
%   となり、その他では 0 になります。 関数の値がすべて 0 の場合でも、
%   計算された場合は DIRECTION(I)=0 (デフォルト) となり、イベント関数が
%   0 から増加している場合に計算された場合は DIRECTION(I)=+1、0 から減少
%   している場合に計算された場合は DIRECTION(I)=-1 となります。 出力 
%   TE は、イベントが発生する時間の列ベクトルです。 YE の行は対応する解で、
%   ベクトル IE のインデックスはどのイベントが発生したかを明記します。 
%
%   SOL = ODE45(ODEFUN,[T0 TFINAL],Y0...) は、T0 と TFINAL 間の任意の点で、
%   解、または一次導関数を計算するため、DEVAL で使用可能な構造体を出力します。
%   ODE45 で選択されるステップは、行ベクトル SOL.x に出力されます。
%   I に対して、列 SOL.y(:,I) は、SOL.x(I) での解を含んでいます。 イベントが
%   検出された場合は、SOL.xe は、イベントが発生した位置を示す点から構成される
%   行ベクトルです。SOL.ye の列ベクトルは、解に対応し、ベクトル SOL.ie の
%   中のインデックスは、どのイベントが発生したかを示します。
%
%   例    
%         [t,y]=ode45(@vdp1,[0 20],[2 0]);   
%         plot(t,y(:,1));
%     は、デフォルトの相対誤差 1e-3 とデフォルトの絶対誤差 1e-6 を各要素に
%     使ってシステム y' = vdp1000(t,y) を解き、解の最初の要素をプロットします。 
%   
%   入力 TSPAN, Y0 と ODEFUN(T,Y) の結果はつぎのクラスをサポートします:
%     float: double, single
%
%   参考
%       他のODEソルバ:      ODE23, ODE113, ODE15S, ODE23S, ODE23T, ODE23TB 
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
%         more on, type ode45, more off


%   Mark W. Reichelt and Lawrence F. Shampine, 6-14-94
%   Copyright 1984-2005 The MathWorks, Inc.
