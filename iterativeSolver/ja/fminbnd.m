%  FMINBND �X�J���Ŕ͈͂̐����t��������`�֐��̍ŏ���
%
%  X = FMINBND(FUN,x1,x2) �́Ax1 < X < x2 �͈̔͂ŁA�֐� FUN �̋Ǐ��I��
%  �ŏ��l X �������悤�Ƃ��܂��BFUN �͊֐��n���h���ł��BFUN �́A�X�J����
%  ���� X ���󂯓���AX �ł̃X�J���̊֐��l F ���o�͂��܂��B
%
%  X = FMINBND(FUN,x1,x2,OPTIONS) �́A�f�t�H���g�̍œK�p�����[�^�̑���
%  �ɁAOPTIMSET �֐��ō쐬���ꂽOPTIONS �\���̂̒l���g���čŏ������s���܂��B
%  �ڂ����́AOPTIMSET ���Q�Ƃ��Ă��������BFMINBND �́A���̃I�v�V�����A
%  Display, TolX, MaxFunEval, MaxIter, FunValCheck, OutputFcn ���g���܂��B
%
%  [X,FVAL] = FMINBND(...)�́A�l X �ł̖ړI�֐� FUN �̒l FVAL ���o�͂��܂��B
%
%  [X,FVAL,EXITFLAG] = FMINBND(...) �́A�܂��AFMINBND �̏I����Ԃ��L�q���� 
%  EXITFLAG ���o�͂��܂��BEXITFLAG �̉\�Ȓl�ƑΉ�����I�������́A����
%  �悤�ɂȂ�܂��B
%
%     1 FMINBND �́AOPTIONS.TolFun ���x�[�X�ɉ� X �Ɏ����������Ƃ������܂��B
%     0 �֐��]���A�܂��́A�J��Ԃ��̍ő吔�ɓ��B�������Ƃ������܂��B
%    -1 �A���S���Y�����o�͊֐��ŏI���������Ƃ������܂��B
%    -2 ���E������ (���Ȃ킿�Aax > bx) ���Ă��邱�Ƃ������܂��B
%
%  [X,FVAL,EXITFLAG,OUTPUT] = FMINBND(...) �́AOUTPUT.iterations �̒��̌J��
%  �Ԃ��񐔁AOUTPUT.funcCount �̒��̊֐��]���̐��AOUTPUT.algorithm �̒���
%  �A���S���Y�����AOUTPUT.message �̒��̏I�����b�Z�[�W���܂񂾍\����
%  OUTPUT ���o�͂��܂��B
%
%  ��
%  FUN �́A@ ���g���Đݒ�ł��܂��B
%        X = fminbnd(@cos,3,4)
% �́A�����܂� pi ���v�Z���A�I�����Ƀ��b�Z�[�W��\�����܂��B
%  [X,FVAL,EXITFLAG] = fminbnd(@cos,3,4,optimset('TolX',1e-12,'Display','off'))
%  �́Api �� 12 ���܂Ōv�Z���A�o�͂�\�����Ȃ��ŁAx �ł̊֐��l���o�͂��A
%  EXITFLAG �� 1 ���o�͂��܂��B
%
% FUN �́A�����֐��ł��ݒ�ł��܂��B
%        x = fminbnd(@(x) sin(x)+3,2,5)
%
% FUN ���p�����[�^�����ꂽ�ꍇ�A���ˑ��̃p�����[�^�𑨂��邽�߂ɁA
% �����֐����g�p�ł��܂��Bmyfun �ɗ^����ꂽ�ړI�֐����ŏ���������̂�
% ���肵�A2 �Ԗڂ̈��� c �Ńp�����[�^�����܂��B�����ŁAmyfun �́A����
% �悤�� M-�t�@�C���ł��B
%
%     function f = myfun(x,c)
%     f = (x - c)^2;
%
% ����� c �̒l���œK������ɂ́A�ŏ��� c �ɒl�����蓖�Ă܂��B���̌�A
% c �̒l�𑨂��� 1 �̈������������֐����쐬���A2 �̈���������
% �����֐����Ăяo���܂��B�Ō�ɁA���̖����֐��� FMINBND �ɓn���܂��B
% 
%     c = 1.5; % �p�����[�^���ŏ��ɒ�`
%     x = fminbnd(@(x) myfun(x,c),0,1)
%
% �Q�l OPTIMSET, FMINSEARCH, FZERO, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc.
