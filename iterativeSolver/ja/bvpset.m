% BVPSET  BVP の OPTIONS 構造体の設定と修正
% 
% OPTIONS = BVPSET('NAME1',VALUE1,'NAME2',VALUE2,...) は、NAME プロパティ
% に設定した値をもつ積分オプション構造体 OPTIONS を作成します。設定されて
% いないプロパティは、デフォルト値を使います。設定するプロパティ名は、
% プロパティ名が識別できる範囲で構いません。また、大文字、小文字の区別は
% ありません。
%   
% OPTIONS = BVPSET(OLDOPTS,'NAME1',VALUE1,...)は、既に設定されている
% オプション構造体 OLDOPTS を変更します。 
%   
% OPTIONS = BVPSET(OLDOPTS,NEWOPTS) は、既に設定されているオプション
% 構造体 OLDOPTS を新しいオプション構造体 NEWOPTS と組み合わせます。
% いくつかの新しいプロパティが、対応する古いプロパティと置き換えられます。
%   
% BVPSET 自身では、すべてのプロパティ名と取り得る可能な値を表示します。
%   
% BVPSET プロパティ
%   
% RelTol - 残差に対する相対許容量、[正のスカラ量  {1e-3} ]
%    このスカラ量は、残差ベクトルのすべての要素に適用されます。そして、
%    デフォルトは、1e-3 (0.1% の精度) です。計算される S(x) は、
%    S'(x) = F(x,S(x))+res(x) の厳密な解になります。メッシュの各部分に
%    おいて、残差 res(x) は、次式を満足します。
% 
%         norm(res(i)/max(abs(F(i)),AbsTol(i)/RelTol)) < =  RelTol
%
% AbsTol - 残差に対する絶対許容量、[正のスカラまたはベクトル  {1e-6}]
%    スカラ許容量は、残差ベクトルのすべての要素に適用されます。許容量
%    ベクトルの各要素は、残差ベクトルの対応する要素に適用されます。
%    AbsTol のデフォルトは 1e-6 です。RelTol を参照してください。 
%
% SingularTerm - 特異な BVP の特異項、[ 行列 ]
%    y' = S*y/x + f(x,y,p) の形式の方程式に対して定数行列 S を設定します。
%
% FJacobian - ODEFUNの解析的な偏微分係数、[ 関数ハンドル | 行列 | セル配列 ]
%    たとえば、y' = f(x,y) を解くとき、 DFDY = FJAC(X,Y) が y に関して
%    ヤコビアン f を計算する場合には、 このプロパティは @FJAC に設定します。
%    問題が未知のパラメータを含む場合は、[DFDY,DFDP] = FJAC(X,Y,P) は p に
%    関する f の解析的な偏微分を出力する必要があります。定数の偏微分をもつ
%    問題に対しては、このプロパティは DFDY の値、あるいはセル配列
%    {DFDY,DFDP} に設定します。
%
% BCJacobian - BCFUNの解析的な偏微分係数、[ 関数ハンドル | セル配列 ]
%    たとえば、境界条件 bc(ya,yb) = 0 の場合、[DBCDYA,DBCDYB] = BCJAC(YA,YB)
%    が ya と yb に関する bc の偏微分を計算する場合は、このプロパティを @BCJAC
%    に設定します。問題が未知のパラメータを含む場合は、
%    [DBCDYA,DBCDYB,DBCDP] = BCJAC(YA,YB,P) は p に関する f の偏微分も出力
%    する必要があります。定数の偏微分をもつ問題に対しては、このプロパティ
%    はセル配列 {DBCDYA,DBCDYB} または {DBCDYA,DBCDYB,DBCDP} に設定します。
%
% Nmax - メッシュ点の許容最大点数、[正の整数 {floor(10000/n)}]
%
% Stats - 計算量の表示、[ on | {off} ]
%
% Vectorized - ベクトル化された ODE 関数、[ on | {off} ]
%    微係数関数 ODEFUN([x1 x2 ...],[y1 y2 ...]) が 
%    [ODEFUN(x1,y1) ODEFUN(x2,y2) ...] を出力する場合は、このプロパティ
%    を 'on' に設定します。パラメータが存在する場合は、微係数関数
%    ODEFUN([x1 x2 ...],[y1 y2 ...],p) は 
%    [ODEFUN(x1,y1,p) ODEFUN(x2,y2,p) ...] を出力します。
%
% 参考 ： BVPGET, BVPINIT, BVP4C, DEVAL, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc.
