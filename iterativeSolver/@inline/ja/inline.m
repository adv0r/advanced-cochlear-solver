% INLINE   INLINEオブジェクトの作成
%
% INLINE(EXPR) は、文字列 EXPR 内に含まれているMATLAB表現からインライン
% 関数オブジェクトを作成します。入力引数は、変数名を EXPR で探索することにより
% 自動的に求められます(参照 SYMVAR)。変数が存在しない場合、'x' が使われます。
%
% INLINE(EXPR, ARG1, ARG2, ...) は、入力引数として文字列 ARG1、ARG2、... を
% 含むインライン関数が作成されます。マルチキャラクタシンボルを使うことが
% できます。
%
% INLINE(EXPR, N) ここで N はスカラで、入力引数が 'x', 'P1', 'P2', ..., 'PN' を
% もつインライン関数を作成します。
%
% 例題:
%     g = inline('t^2')
%     g = inline('sin(2*pi*f + theta)')
%     g = inline('sin(2*pi*f + theta)', 'f', 'theta')
%     g = inline('x^P1', 1)
%
%   参考 SYMVAR.


%   Steven L. Eddins, August 1995
%   Copyright 1984-2004 The MathWorks, Inc. 
