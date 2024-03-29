% DDESET  DDE OPTIONS構造体の作成と修正.
%
% OPTIONS = DDESET('NAME1',VALUE1,'NAME2',VALUE2,...) は、指定した
% プロパティが指定した値をもつ積分オプション構造体 OPTIONS を作成します。
% 指定されていないプロパティは、デフォルト値を使います。設定するプロパティ
% 名は、プロパティ名が識別できる範囲で構いません。また、大文字、小文字を
% 区別しません。
%   
% OPTIONS = DDESET(OLDOPTS,'NAME1',VALUE1,...) は、既に設定されて
% いるオプション構造体OLDOPTSを変更します。
%   
% OPTIONS = DDESET(OLDOPTS,NEWOPTS) は、既に設定されているオプション
% 構造体 OLDOPTS と、新規オプション構造体 NEWOPTS を組合せます。
% 新規プロパティは、対応する古いプロパティを変更します。
%   
% DDESET 自身では、すべてのプロパティ名と取り得る値を表示します。
%   
% DDESET プロパティ
%   
% RelTol - 相対許容誤差 [ 正のスカラ {1e-3} ]
%    このスカラ量は、すべての解のベクトルに適用され、デフォルトは
%    1e-3 (0.1% の精度) です。各積分ステップでの推定誤差は、
%    e(i) <= max(RelTol*abs(y(i)),AbsTol(i)) を満足します。
%
% AbsTol - 絶対許容誤差 [ 正のスカラまたはベクトル {1e-6} ]
%    スカラ許容値は、解のベクトルのすべての要素に適用されます。
%    許容値ベクトルの要素は、解のベクトルの対応する要素に適用されます。
%    AbsTol のデフォルトは、1e-6 です。
%
% NormControl - 解のノルムの誤差の制御 [ on | {off} ]
%    norm(e) <= max(RelTol*norm(y),AbsTol) である各積分ステップでの誤差
%    をソルバが制御するために、このプロパティを 'on' に設定します。
%    デフォルトでは、ソルバは、より厳密な要素単位の誤差制御を利用します。
%
% Events - イベントの検出 [ 関数ハンドル ]
%    イベントを検出するために、このプロパティはイベント関数に設定します。
%   
% InitialStep - 推奨される初期ステップサイズ [ 正のスカラ ]
%    ソルバは、この値を最初に試します。デフォルトでは、ソルバは初期
%    ステップサイズを自動的に決定します。
%
% MaxStep - ステップサイズの上限 [ 正のスカラ ]
%    MaxStep のデフォルトは、区間 tspan の 1/10 です。
%   
% OutputFcn - 設定可能な出力関数 [ 関数ハンドル ]
%   この出力関数は、各時間ステップの後にソルバによって呼び出されます。
%   ソルバが出力引数なしで呼び出されるときは、OutputFcn のデフォルトは
%   @odeplot です。そうでない場合は、OutputFcn のデフォルトは [] です。
%   
% OutputSel - 出力選択インデックス [ 整数のベクトル ]
%   このインデックスのベクトルは、解のベクトルのどの要素が OutputFcn に
%   渡されるかを指定します。OutputSel のデフォルトは全要素です。
%   
% Stats - 計算量の表示  [ on | {off} ]
%   
% InitialY - 解の初期値 [ ベクトル ]
%   デフォルトでは、解の初期値は、初期の点で HISTORY によって出力される値
%   です。InitialY プロパティの値によっては異なる初期値が与えられる場合
%   があります。
%
% Jumps - 解の不連続性 [ ベクトル ]
%   history または解が低次の微係数でジャンプによる不連続をもつ点 t。
%   このプロパティは、DDESD では利用できません。
%   
% 参考 ： DDEGET, DDE23, DDESD, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc.
