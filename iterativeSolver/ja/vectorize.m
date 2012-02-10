% VECTORIZE   ベクトル化の表現
%
% VECTORIZE(S) は、S が文字列のとき、S の '^'、'*' 、'/' の前に '.' を
% 挿入します。出力結果は、キャラクタ文字列です。
%
% VECTORIZE(FUN)は、FUN がINLINE関数オブジェクトのとき、FUN の式をベクトル
% 化します。結果は、関数 INLINE のベクトル化されたものになります。
%
% 参考 ： INLINE/FORMULA, INLINE.


%   Copyright 1984-2004 The MathWorks, Inc.

