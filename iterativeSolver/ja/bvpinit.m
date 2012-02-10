% BVPINIT  BVP4C 用の初期推定を行います。
% 
% SOLINIT = BVPINIT(X,YINIT) は、一般的な環境で、BVP4C 用の初期推定を行い
% ます。BVP は、区間 [a,b] で解かれます。ベクトル X は、X(1) = a, X(end) = b
% のように a と b を指定します。適切なメッシュに対する推定にもなります。
% BVP4C は、このメッシュを解法に使います。それで、x = logspace(a,b,10) の
% ような推定でも十分ですが、複雑な場合は、メッシュ点は、解が急激に変化する
% 場所に設定しなければなりません。
%
% X は昇順である必要があります。2 点 BVP においては、X の要素は区別され、
% a < b の場合、X(1) < X(2) < ... < X(end) のように順序付けられている
% 必要があります。多点 BVP の場合は、[a,b] においていくつかの境界条件が
% あります。一般的に、これらの点は境界を表わし、[a,b] 領域において自然に
% 分割されます。BVPINIT は領域に対して左から右 (a から b)に与えられ、
% インデックスは 1 から開始します。境界は初期メッシュ X の double の要素で
% 指定できます。BVPINIT は、1 つめの要素を領域 k の右終点、他方を領域 
% k+1 の左終点として解釈します。THREEBVP は、3点 BVP の例です。
% 
% YINIT は、解に対する推定です。この推定に対して、微分方程式と境界条件を
% 計算できなければなりません。YINIT は、ベクトル、または、関数ハンドルの
% いずれかになります。
% 
% ベクトル： YINIT(i) は、X 内のすべてのメッシュ点での解の i 番目の
%            要素 Y(i,:) の定数推定です。
%
% 関数: YINIT は、スカラ x の関数です。たとえば、区間 [a,b] の任意
%       の値 x に対して、yfun(x) が、解 y(x) に対する推定を戻す場合、
%       solinit = bvpinit(x,@yfun) を使います。
%     
% SOLINIT = BVPINIT(X,YINIT,PARAMETERS) は、BVP が未知パラメータを含む
% ことを意味しています。推定は、ベクトル PARAMETERS の中のすべての
% パラメータに対して用意されます。
%
% SOLINIT = BVPINIT(SOL,[ANEW BNEW]) は、区間 [a,b] 上の解 SOL から、
% 区間 [ANNEW,BNEW] 上での初期推定を作成します。新しい区間は、
% ANEW <= a < b <= BNEW、または、ANEW >= a > b >= BNEW のように、より
% 大きくなければなりません。解 SOL は、新しい区間に外挿されます。存在
% する場合、SOL から PARAMETERS は、 SOLINIT を使います。
% 未知パラメータに対して、異なる推定を与える場合、
% SOLINIT = BVPINIT(SOL,[ANEW BNEW],PARAMETERS) を使用してください。
%
% 参考  BVPGET, BVPSET, BVP4C, DEVAL, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc.
