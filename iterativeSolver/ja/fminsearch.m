% FMINSEARCH �������̐���Ȃ��̔���`�ŏ��� (Nelder-Mead �@�j
%
% X = FMINSEARCH(FUN,X0) �́AX0 �Ŏn�܂�A�֐� FUN �̋Ǐ��I�ȍŏ��_ X ��
% �����悤�Ƃ��܂��BFUN �͊֐��n���h���ł��BFUN �́A���� X ���󂯓���A
% X �Ōv�Z�����X�J���̊֐��l F ���o�͂��܂��BX0 �́A�X�J���A�x�N�g���A
% �s��ɂȂ�܂��B
%
% X = FMINSEARCH(FUN,X0,OPTIONS) �́A�f�t�H���g�̍œK�p�����[�^�̑���ɁA
% OPTIMESET �֐��ō쐬���ꂽ OPTIONS �\���̂̒l���g���čŏ������s���܂��B
% �ڂ����́AOPTIMSET ���Q�Ƃ��Ă��������BFMINSEARCH �́A�I�v�V���� Display, 
% TolX, TolFun, MaxFunEvals, MaxIter, FunValCheck, OutputFcn ���g�p���܂��B 
%
% [X,FVAL] =  FMINSEARCH(...) �́A�l X �ł̖ړI�֐� FUN �̒l���o�͂��܂��B
%
% [X,FVAL,EXITFLAG] = FMINSEARCH(...) �́AFMINSEARCH �̏I����Ԃ��L�q����
% EXITFLAG ���o�͂��܂��BEXITFLAG �̉\�Ȓl�ƑΉ�����I�������́A����
%  �悤�ɂȂ�܂��B
%
%     1 FMINSEARCH �͉� X �Ŏ����������Ƃ������܂��B
%   �@0 �֐��]���A�܂��́A�J��Ԃ��̍ő吔�ɓ��B�������Ƃ������܂��B
%    -1 �A���S���Y�����o�͊֐��ŏI���������Ƃ������܂��B
%
% [X,FVAL,EXITFLAG,OUTPUT] = FMINSEARCH(...) �́AOUTPUT.iterations �̒���
% �J��Ԃ��񐔁AOUTPUT.funcCount �̒��̊֐��]���̐��AOUTPUT.algorithm ��
% ���̃A���S���Y�����AOUTPUT.message �̒��̏I�����b�Z�[�W���܂񂾍\����
% OUTPUT ���o�͂��܂��B
%
% ��
% FUN �́A@ ���g���āA�ݒ肷�邱�Ƃ��ł��܂��B
%        X = fminsearch(@sin,3)
% �́A�l 3 �̋ߖT�ŁASIN �̍ŏ��l�����߂܂��B���̏ꍇ�ASIN �́AX �ł�
% �X�J���̊֐��l SIN ���o�͂��܂��B
%
% FUN �́A�����֐����g���āA�ݒ肷�邱�Ƃ��ł��܂��B
%        X = fminsearch(@(x) norm(x),[1;2;3])
% �́A [0;0;0] �̋ߖT�ōŏ��l���o�͂��܂��B
%
% FUN ���p�����[�^�����ꂽ�ꍇ�A���ˑ��̃p�����[�^�𑨂��邽�߂ɁA
% �����֐����g�p�ł��܂��Bmyfun �ɗ^����ꂽ�ړI�֐����œK��������̂�
% ���肵�A2 �Ԗڂ̈��� c �Ńp�����[�^�����܂��B�����ŁAmyfun �́A����
% �悤�� M-�t�@�C���ł��B
%
%     function f = myfun(x,c)
%     f = x(1)^2 + c*x(2)^2;
%
% ����� c �l�ɑ΂��čœK������ɂ́A�ŏ��� c �ɒl�����蓖�Ă܂��B���̌�A
% c �̒l�𑨂��� 1 �̈������������֐����쐬���A2 �̈���������
% �����֐����Ăяo���܂��B�Ō�ɁA���̖����֐��� FMINBND �ɓn���܂��B
% 
%     c = 1.5; % �p�����[�^���ŏ��ɒ�`
%     x = fminsearch(@(x) myfun(x,c),[0.3;1])
%
% FMINSEARCH �́ANelder-Mead �V���v���b�N�X (����) �@���g���Ă��܂��B
%
% �Q�l OPTIMSET, FMINBND, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc.
