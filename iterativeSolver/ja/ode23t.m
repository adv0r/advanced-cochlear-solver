% ODE23T  中程度の精度でスティッフなODEsとDAEsを台形則を使って解きます
%
%   [TOUT,YOUT] = ODE23T(ODEFUN,TSPAN,Y0) は、TSPAN = [T0 TFINAL] のとき、
%   初期状態 Y0 で、時刻 T0 から TFINAL まで微分方程式システム y' = f(t,y) 
%   を積分します。 ODEFUN は関数ハンドルです。 スカラ T とベクトル Y に
%   対して、ODEFUN(T,Y) は f(t,y) に対応する列ベクトルを返さなければ
%   なりません。 解の配列 YOUT の各行は、列ベクトル TOUT に出力される
%   時間に対応します。 時間 T0,T1,..., TFINAL (単調増加または単調減少) 
%   での解を求めるためには、TSPAN = [T0 T1 ... TFINAL] を使用してください。
%   
%   [TOUT,YOUT] = ODE23T(ODEFUN,TSPAN,Y0,OPTIONS) は、デフォルトの積分
%   パラメータを OPTIONS の値で置き換えて、上記のように解きます。 
%   OPTIONS は、関数 ODESET で作成された引数です。詳細は、関数 ODESET を
%   参照してください。 一般に使用されるオプションは、スカラの相対許容
%   誤差 'RelTol' (デフォルトでは 1e-3) と、絶対許容誤差ベクトル 'AbsTol' 
%   (デフォルトでは 1e-6) です。 一部の解の成分が、非負でなければなない
%   場合、'NonNegative' プロパティをこれらの成分のインデックスに設定
%   するために ODESET を使用してください。 'NonNegative' プロパティは、
%   質量行列がある問題に対して無視されます。
%   
%   ヤコビ行列 df/dy は、計算信頼性と効率性に敏感です。 FJAC(T,Y) が
%   ヤコビアン df/dy や、行列 df/dy (ヤコビアンが定数の場合) を出力する
%   場合、ODESET を使って、'jacobian' オプションに関数ハンドル FJAC を
%   設定してください。 'Jacobian' オプションを設定していない場合 (デフォルト)、
%   df/dy は、有限差分により得られます。 ODEFUN(T,[Y1,Y2,...]) が、
%   [ODEFUN(T,Y1),ODE ...] を出力するように ODE 関数がコード化されている
%   場合、'Vectorizes' を 'on' に設定してください。 df/dy がスパース行列
%   の場合、'JPattern' を df/dy のスパースパターンに設定してください。
%   すなわち、f(t,y) の i 番目の要素が y の j 番目の要素に依存する場合は 
%   S(i,j) = 1 で、他の場合 0 のスパース行列 S になります。   
%
%   ODE23T は、質量行列 M(t,y) をもつ問題 M(t,y)*y' = f(t,y) を解きます。
%   MASS(T,Y) が質量行列の値を出力する場合は、ODESET を使って関数ハンドル
%   MASS に 'Mass' プロパティを設定します。 質量行列が定数の場合、行列は、
%   'Mass' オプションの値として使われます。 状態依存の質量行列をもつ問題
%   は、より難しいものになります。 質量行列が状態変数 Y に依存せず、関数
%   MASSが1つの入力引数 T と共に呼び出される場合は、'MStateDependence' を
%   'none' に設定してください。 質量行列が Y に少し依存する場合、
%   'MStateDependence' を 'weak' (デフォルト) に、他の場合は、'strong' に
%   設定してください。 いずれの場合も関数 MASS は、2つの引数 (T,Y) と共に
%   呼び出されます。 多くの微分方程式が存在する場合、スパース性をはっきり
%   させること、スパース M(t,y) を出力させることは重要なことです。
%   'JPattern' プロパティを使って、df/dy のスパースパターンを設定するか、
%   または、Jacobian プロパティを使って、スパース df/dy を設定します。
%   状態変数に強く依存する M(t,y) の場合、'MvPattern' をスパース行列 S 
%   に設定してください。 ここで、S は、任意の k に対して、M(t,y) の (i,k)
%   要素が y の j 要素に依存する場合、S(i,j) = 1 で、他の場合は 0 である
%   行列です。   
%
%   質量行列が正則な場合、問題の解は、直接的なものになります。 例題
%   FEM1ODE, FEM2ODE, BATONODE, BURGERSODE を参照してください。
%   M(t0,y0) が正則でない場合、問題は、微分代数方程式 (DAE) になります。
%   ODE23T は、インデックス 1 の DAE を解きます。 DAE は、y0 が一致する
%   場合、すなわち、M(t0,y0)*yp0 = f(t0,y0) を満たす yp0 が存在するとき
%   のみ、解をもちます。 ODESET を使って 'MassSingular' に、'yes','no',
%   'maybe' のいずれかを設定することができます。 'maybe' がデフォルトで、
%   M(t0,y0) が正則であるか否かのチェックをします。 'InitialSlope' 
%   プロパティの値として、yp0 を与えます。 デフォルトは、ゼロベクトルです。
%   y0 と yp0 に矛盾が存在する場合、ODE23T は推定値としてそれらを取り扱い、
%   推定に近い矛盾のない値を計算しようとします。 そして、問題を解きます。
%   HB1DAE または AMP1DAE の例題を参照してください。
%
%   [TOUT,YOUT,TE,YE,IE] = ODE23T(ODEFUN,TSPAN,Y0,OPTIONS) は、OPTIONS の
%   'Events' プロパティが関数ハンドル EVENTS に設定されてる場合は上記の
%   ように解き、イベント関数と呼ばれる (T,Y) の関数が 0 となる点を求めます。
%   指定する各関数に対して、積分が 0 で終了するかどうか、およびゼロ
%   クロッシングの方向は重要です。 これらは、EVENTS: 
%   [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y) によって返される 3 つの
%   ベクトルです。 I 番目のイベント関数に対して、VALUE(I) は、積分がこの
%   イベント関数の 0 で終了する場合は、関数 ISTERMINAL(I)=1 の値で、
%   そうでない場合は 0 です。 すべての 0 が計算される (デフォルト) 場合は、
%   DIRECTION(I)=0 で、イベント関数が増加した点のみ 0 である場合は 
%   +1 で、イベント関数が減少した点のみ零点である場合は -1 です。 出力 
%   TE は、イベントが発生する時間の列ベクトルです。 YE の行は対応する解で、
%   ベクトル IE のインデックスはどのイベントが発生したかを指定します。  
%
%   SOL = ODE23T(ODEFUN,[T0 TFINAL],Y0...) は、T0 と TFINAL 間の任意
%   の点で、解を計算するため、DEVAL で使用可能な構造体を出力します。
%   ODE23T で選択されたステップは、行ベクトル SOL.x に出力されます。
%   I に対して、列 SOL.y(:,I) は、SOL.x(I) での解を含んでいます。 
%   イベントが検出された場合は、SOL.xeは、イベントが発生した位置を示す
%   点から構成される行ベクトルです。 SOL.ye の列は、対応する解で、
%   ベクトル SOL.ie のインデックスは、イベントが発生したものがどれかを
%   示しています。ターミナルイベントが検出される場合、SOL.x(end) は、
%   イベントが発生した位置でのステップの終わりを含んでいます。 
%   イベントの正確な位置は、SOL.xe(end) に報告されます。
%
%   例
%         [t,y]=ode23t(@vdp1000,[0 3000],[2 0]);   
%         plot(t,y(:,1));
%     は、デフォルトの相対誤差 1e-3 とデフォルトの絶対誤差 1e-6 を各成分に
%     使ってシステム y' = vdp1000(t,y) を解き、解の最初の要素をプロットします。
%
%   参考
%     他のODEソルバ:        ODE15S, ODE23S, ODE23TB, ODE45, ODE23, ODE113
%     陰的 ODE     :        ODE15I
%     options の取り扱い:   ODESET, ODEGET
%     出力関数     :        ODEPLOT, ODEPHAS2, ODEPHAS3, ODEPRINT
%     解の計算     :        DEVAL
%     ODE 例       :        VDPODE, FEM1ODE, BRUSSODE, HB1DAE
%     関数ハンドル :        FUNCTION_HANDLE
%
%   注意: 
%     ODE ソルバの最初の入力引数と ODESET へ渡すいくつかのプロパティの
%     解釈は、MATLAB 6.0 で変更されています。 
%     バージョン 5 のシンタックスは現在、サポートしていますが、新しい
%     機能は、新しいシンタックスでのみ使用可能です。バージョン 5 のヘルプを
%     見るには、つぎのように入力してください。
%         more on, type ode23t, more off


%   Mark W. Reichelt, Lawrence F. Shampine, Yanyuan Ma, and Jacek Kierzenka
%   12-18-97
%   Copyright 1984-2005 The MathWorks, Inc.
