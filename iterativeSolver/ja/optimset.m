% OPTIMSET   最適化 OPTIONS 構造体の作成/変更
%
% OPTIONS = OPTIMSET('PARAM1',VALUE1,'PARAM2',VALUE2,...) は、指定した
% パラメータと値の組をもつ最適化オプション構造体 OPTIONS を作成します。
% 指定されていないパラメータは、[] に設定されます ([] のパラメータ値は、
% OPTIONS が最適化関数に渡されるときにデフォルト値を利用します)。
% パラメータを一意的に識別する頭文字をタイプするだけで設定することができます。
% パラメータ名の大文字と小文字の区別は無視されます。
% 注意: 文字列の値は、完全な文字列が必要です。
%   
% OPTIONS = OPTIMSET(OLDOPTS,'PARAM1',VALUE1,...) は、指定した値で変更
% されたパラメータ値をもつ OLDOPTS のコピーを作成します。
%   
% OPTIONS = OPTIMSET(OLDOPTS,NEWOPTS) は、既存のオプション構造体 OLDOPTS 
% と新規のオプション構造体 NEWOPTS を結合します。NEWOPTS の空の値でない
% パラメータは、OLDOPTS 内の対応する古いパラメータを上書きします。
%   
% OPTIMSET で、入力と出力引数を設定しない場合は、すべてのパラメータ名と
% それらの取り得る値を表示します。このオプションを使う全ての関数に対して
% デフォルト値が同じ場合は、デフォルトを {} に表示します。特定の関数に
% 対するオプションを表示するには、OPTIMSET(OPTIMFUNCTION) を利用します。
%
% OPTIONS = OPTIMSET は、入力引数を設定しない場合は、すべてのフィールドが
% [] に設定されているオプション構造体 OPTIONS を作成します。
%
% OPTIONS = OPTIMSET(OPTIMFUNCTION) は、OPTIMFUNCTION という名前の
% 最適化関数に関連するすべてのパラメータ名とデフォルト値をもつ
% オプション構造体を作成します。たとえば、
%           optimset('fminbnd') 
% または
%           optimset(@fminbnd)
% は、関数 'fminbnd' に関連するすべてのパラメータ名とデフォルト値を含む
% オプション構造体を出力します。
%
%MATLAB の最適化パラメータ
%Display - 表示レベル [ off | iter | notify | final ]
%MaxFunEvals - 関数評価の可能な最大数
%                     [ 正の整数 ]
%MaxIter - 繰り返し可能な最大数 [ 正のスカラ ]
%TolFun - 関数値の終了許容値 [ 正のスカラ ]
%TolX - X の 終了許容値 [ 正のスカラ ]
%FunValCheck - ユーザが与えた関数から、NaN または 複素数など、無効な値をチェック
%              [ {off} | on ]
%OutputFcn - インストールできる出力関数名  [ function ]
%            この出力関数は、各繰り返しの後、ソルバによりコールされます。
%
%   注意: OPTIMIZATION TOOLBOX の OPTIMSET パラメータを見るためには
%         (Optimization Toolbox をインストールしている場合)、 
%         つぎのように入力してください。
%             help optimoptions
%
% 例
%   FZERO のデフォルトのオプションを使用してオプションを生成する場合
%     options = optimset('fzero');
%   1e-3 の TolFun 使用してオプション構造体を生成する場合
%     options = optimset('TolFun',1e-3);
%   オプションの Display 値を 'iter' に変更する場合
%     options = optimset(options,'Display','iter');
%
%   参考 OPTIMGET, FZERO, FMINBND, FMINSEARCH, LSQNONNEG.


%   Copyright 1984-2006 The MathWorks, Inc. 
