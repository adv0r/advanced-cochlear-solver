% ODE15I  可変次数法による完全陰的微分方程式の解法
%
%   [TOUT,YOUT] = ODE15I(ODEFUN,TSPAN,Y0,YP0) は、TSPAN = [T0 TFINAL] の
%   場合、初期条件を Y0,YP0 として、微分方程式のシステム f(t,y,y') = 0 を
%   時刻 T0 から TFINAL まで積分します。 関数 ODE15I は、ODE とインデックス 
%   1 の DAE を解きます。 初期条件は、"consistent" (f(T0,Y0,YP0)=0 を意味
%   します) でなければなりません。 関数 DECIC を使って、推定値に近い矛盾の
%   ない初期条件を計算します。 ODEFUN は関数ハンドルです。 スカラ T と
%   ベクトル Y と YP に対して、ODEFUN(T,Y,YP) は、f(t,y,y') に対応する
%   列ベクトルを返さなければなりません。 解の配列 YOUTの各行は、列ベクトル
%   TOUT で返される時間に対応する解です。特定の時刻 T0,T1,...,TFINAL 
%   (単調増加、あるいは、単調減少) で、解を得るためには、
%   TSPAN = [T0 T1 ... TFINAL] を使用してください。
%   
%   [TOUT,YOUT] = ODE15I(ODEFUN,TSPAN,Y0,YP0,OPTIONS) は、デフォルトの
%   積分プロパティを OPTIONS の値で置き換えて解きます。 OPTIONS は、
%   関数 ODESET で作成された引数です。 詳細は、ODESET を参照してください。
%   一般に使用されるオプションは、スカラの相対許容誤差 'RelTol' (デフォルトで
%   1e-3) と、絶対許容誤差のベクトル 'AbsTol' (すべての成分がデフォルトで
%   1e-6) です。
%   
%   ヤコビ行列 df/dy と df/dy' は、信頼性と効率化のための決定的な要素です。
%   [DFDY,DFDYP] = FJAC(T,Y,YP) が行列 df/dy と df/dy' を返す場合、
%   ODESET を使って、'Jacobian' を関数ハンドル FJAC に設定してください。
%   DFDY = [] の場合、df/dy は有限差分で近似され、DFDYP も同様です。
%   'Jacobian' オプションが設定されない (デフォルトの) 場合、両方の行列は
%   有限差分で近似されます。
%   ODEFUN(T,[Y1 Y2 ...],YP) が [ODEFUN(T,Y1,YP) ODEFUN(T,Y2,YP) ...] を
%   返すように ODE 関数をコード化する場合、'Vectorized' を {'on','off'} 
%   に設定してください。
%   ODEFUN(T,Y,[YP1 YP2 ...]) が [ODEFUN(T,Y,YP1) ODEFUN(T,Y,YP2) ...] を
%   返すように ODE 関数をコード化する場合、'Vectorized' を {'off','on'} 
%   に設定してください。
%   df/dy または df/dy' がスパース行列の場合、'JPattern' をスパースパターン 
%   {SPDY,SPDYP} に設定してください。 df/dy のスパースパターンは f(t,y,yp) 
%   の成分 i が y の成分 j に依存する場合に SPDY(i,j) = 1、それ以外は 0 と
%   なるスパース行列 SPDY です。 SPDY = [] を使用すると df/dy がフル行列で
%   あることを示します。 df/dy' と SPDYP に対しても同様です。 'JPattern' の
%   デフォルト値は、{[],[]} です。
%
%   [TOUT,YOUT,TE,YE,IE] = ODE15I(ODEFUN,TSPAN,Y0,YP0,OPTIONS) は、関数
%   ハンドル EVENTS に設定される OPTION に 'Events' プロパティがある場合
%   の解法で、イベント関数と呼ばれる (T,Y,YP) の関数が 0 になる点も見つけ
%   ます。 各関数に対して、積分を 0 で終えるべきかどうか、また、ゼロ
%   クロッシングの方向が問題になるかどうかを指定します。 これらは、EVENTS 
%   で返される 3 つの列ベクトル [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y,YP) 
%   です。 I 番目のイベント関数に対して: VALUE(I) は、関数の値です。
%   積分がこのイベント関数のゼロ点で終えられる場合、ISTERMINAL(I)=1 
%   であり、そうでない場合、0です。すべての零点を計算する場合(デフォルト)、
%   DIRECTION(I)=0, イベント関数が増加しているところでのゼロ点のみ計算する場合、
%   +1, イベント関数が減少しているところでの零点のみ計算する場合、-1 です。 
%   出力TE は、イベントが起こる時刻の列ベクトルです。 YE の行は、対応
%   する解であり、ベクトル IE のインデックスは、どのイベントが起こるか
%   を示します。
%   
%   SOL = ODE15I(ODEFUN,[T0 TFINAL],Y0,YP0,...) は、T0 と TFINALの
%   間の任意の点での解、または、解の1階導関数を評価するために DEVAL で
%   使用される構造体を出力します。 ODE15I により選択されたステップは、
%   行ベクトル SOL.x に出力されます。 各 I に対し、列 SOL.y(:,I) は、
%   SOL.x(I) での解を含みます。イベントが検出された場合、SOL.xe は、
%   イベントが発生した点から構成される行ベクトルです。 SOL.ye の列は、
%   対応する解であり、ベクトル SOL.ie のインデックスは、どのイベントが
%   起こったかを示します。
%
%   例
%         t0 = 1;
%         y0 = sqrt(3/2);
%         yp0 = 0;
%         [y0,yp0] = decic(@weissinger,t0,y0,1,yp0,0);
%   この例では、 y(t0) に対する初期値を固定するために
%   補助関数 DECIC を使用します。
%   Weissinger の陰的 ODE に対する、y'(t0) に対して矛盾のない
%   初期値を計算します。 本 ODE は、ODE15I を使用して解かれ、数値解が
%   解析解に対して、プロットされます。
%         [t,y] = ode15i(@weissinger,[1 10],y0,yp0);
%         ytrue = sqrt(t.^2 + 0.5);
%         plot(t,y,t,ytrue,'o');
%
%   参考
%     他の ODE ソルバ:        ODE15S, ODE23S, ODE23T, ODE23TB, ODE45, ODE23, ODE113
%     初期条件       :        DECIC
%     オプションハンドリング: ODESET, ODEGET
%     出力関数       :        ODEPLOT, ODEPHAS2, ODEPHAS3, ODEPRINT
%     解の評価       :        DEVAL
%     ODE 例         :        IHB1DAE, IBURGERSODE
%     関数ハンドル   :        FUNCTION_HANDLE


%   Jacek Kierzenka and Lawrence F. Shampine
%   Copyright 1984-2005 The MathWorks, Inc.
