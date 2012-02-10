% DDEGET  DDE の OPTIONS パラメータの取得
%
% VAL = DDEGET(OPTIONS,'NAME') は、積分オプション構造体 OPTIONS から
% 指定したプロパティの値を取得し、プロパティ値が OPTIONS に指定されて
% いない場合は空行列を出力します。NAME の設定は、プロパティ名全体を設定
% するのではなく、固有に判断できる文字で構いません。プロパティ名の設定は、
% 大文字、小文字の区別はありません。[] は使用できる正しい型の OPTIONS 
% 引数です。
%   
% VAL = DDEGET(OPTIONS,'NAME',DEFAULT) は、上記のように指定したプロパティ
% を取得しますが、指定したプロパティが OPTIONS にない場合は、
% VAL = DEFAULT を出力します。たとえば、
%   
%       val = ddeget(opts,'RelTol',1e-4);
%   
% RelTol プロパティが opts で指定されていない場合は、val = 1e-4 を出力します。
%   
% 参考 ： DDESET, DDE23, DDESD.


%   Copyright 1984-2006 The MathWorks, Inc.
