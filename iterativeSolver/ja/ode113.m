% ODE113  可変次数によるノンスティッフな微分方程式の解法
%
%   [TOUT,YOUT] = ODE113(ODEFUN,TSPAN,Y0) は、TSPAN = [T0 TFINAL] のとき、
%   初期条件 Y0 で、時刻 T0 から TFINAL まで微分方程式システム y' = f(t,y) 
%   を積分します。 ODEFUN は関数ハンドルです。 スカラ T とベクトル Y に
%   に対して ODEFUN(T,Y) は、f(t,y) に対応する列ベクトルを返さなければ
%   なりません。 解の配列 Y の各行は、列ベクトル TOUT に出力される時間に
%   対応します。 時間T0,T1,..., TFINAL(単調増加または単調減少)での解を
%   求めるためには、TSPAN = [T0 T1 ... TFINAL] を使用してください。
%   
%   [TOUT,YOUT] = ODE113(ODEFUN,TSPAN,Y0,OPTIONS) は、デフォルトの積分
%   パラメータを OPTIONS の値で置き換えて、解きます。 OPTIONS は、関数 
%   ODESET で作成された引数です。 詳細は、関数 ODESET を参照してください。
%   一般的に使用されるオプションは、スカラの相対許容誤差 'RelTol' 
%   (デフォルトでは 1e-3) と、絶対 許容誤差ベクトル 'AbsTol' (デフォルト
%   ではすべての要素が 1e-6) です。 一部の解の成分は、非負でなければ
%   ならない場合、これらの成分のインデックスに対して 'NonNegative' 
%   プロパティを設定するために ODESET を用いてください。
%   
%   ODE113 は、正則な質量行列 M をもつ問題 M(t,y)*y' = f(t,y) を解きます。
%   MASS(T,Y) が質量行列の値を出力する場合は、ODESET を使って関数ハンドル
%   MASS に、'Mass' プロパティを設定します。質量行列が定数の場合、行列は、
%   'Mass' オプションの値として使われ、質量行列が状態変数 Y に依存せず、
%   関数 Mass が1つの入力引数 T と共に呼び出される場合、'MStateDependence'
%   を 'none' に設定します。 その他の場合、'MStateDependence' に 'weak'
%   (デフォルト) または、'strong' を設定します。 どちらの場合も、関数 
%   MASS は2つの引数 (T,Y) と共に呼び出されます。 ODE15S と ODE23T は、
%   特異質量行列をもつ問題を解きます。   
%
%   [TOUT,YOUT,TE,YE,IE] = ODE113(ODEFUN,TSPAN,Y0,OPTIONS) は、OPTIONS の 
%   'Events' プロパティが関数 EVENTS に設定されている場合は上記のイベント
%   関数と呼ばれる (T,Y) の関数がゼロとなる点を求めます。 各関数に対して、
%   積分を 0 で終えるべきかどうか、そしてゼロクロッシングの方向が問題に
%   なるかどうか指定します。 これらは、つぎの EVENTS、
%   [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y) によって出力される 3 つの
%   ベクトルです。 I 番目のイベント関数に対して、VALUE(I) は、関数の値です。
%   積分がこのイベント関数のゼロで終了する場合は関数 ISTERMINAL(I)=1 の
%   値で、そうでない場合は0です。 すべてのゼロが計算される(デフォルト)場合は、
%   DIRECTION(I)=0 で、イベント関数が増加した点のみゼロである場合は +1
%   で、イベント関数が減少した点のみゼロである場合は -1 です。 出力 TE は、
%   イベントが発生する時間の列ベクトルです。YE の行は対応する解で、ベクトル 
%   IE のインデックスはどのイベントが発生したかを指定します。
%
%   SOL = ODE113(ODEFUN,[T0 TFINAL],Y0...) は、T0 と TFINAL 間の任意の点に
%   おける解、または1次導関数を計算するため、DEVAL で使用可能な構造体を
%   出力します。 ODE113 で選択されたステップは、行ベクトル SOL.x に出力
%   されます。 各 I に対して、列 SOL.y(:,I) は、SOL.x(I) での解を含んで
%   います。 イベントが検出された場合は、SOL.xe は、イベントが発生した
%   点から構成される行ベクトルです。 SOL.ye の列は、対応する解で、ベクトル 
%   SOL.ie のインデックスは、どのイベントが発生したかを示しています
%  
%   例
%         [t,y]=ode113(@vdp1,[0 20],[2 0]);   
%         plot(t,y(:,1));
%     
%   は、デフォルトの相対誤差 1e-3 とデフォルトの絶対誤差 1e-6 を各成分に
%   使ってシステム y' = vdp1(t,y) を解き、解の最初の要素をプロットします。
%  
%   入力 TSPAN、Y0、ODEFUN(T,Y) の出力に対するクラスサポート:
%     float: double, single
%
%   参考 
%       他の ODE ソルバ:        ODE45, ODE23, ODE15S, ODE23S, ODE23T, ODE23TB
%       陰的 ODE       :        ODE15I
%       OPTIONS の取り扱い:     ODESET, ODEGET
%       出力関数       :        ODEPLOT, ODEPHAS2, ODEPHAS3, ODEPRINT
%       解の計算       :        DEVAL
%       ODE 例         :        RIGIDODE, BALLODE, ORBITODE
%       関数ハンドル   :        FUNCTION_HANDLE 
%
%   注意: 
%     ODE ソルバの最初の入力引数と ODESET へ渡すいくつかのプロパティの
%     解釈は、MATLAB 6.0 で変更されています。 
%     バージョン 5 のシンタックスは現在、サポートしていますが、新しい
%     機能は、新しいシンタックスでのみ使用可能です。バージョン 5 のヘルプを
%     見るには、つぎのように入力してください。
%         more on, type ode113, more off


%   Mark W. Reichelt and Lawrence F. Shampine, 6-13-94
%   Copyright 1984-2005 The MathWorks, Inc.
