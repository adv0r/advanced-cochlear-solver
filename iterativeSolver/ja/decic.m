%DECIC  ODE15I �ɑ΂��閵���̂Ȃ������������v�Z
%
% [Y0MOD,YP0MOD] = DECIC(ODEFUN,T0,Y0,FIXED_Y0,YP0,FIXED_YP0) �́A
% ODEFUN(T0,Y0MOD,YP0MOD) = 0 �𖞂����o�͒l�������邽�߂̌J��Ԃ���
% �����̐���l�Ƃ��āA���� Y0,YP0 ���g�p���܂��BODEFUN �͊֐��n���h���ł��B
% T0 �̓X�J���ŁAY0 �� YP0 �͗�x�N�g���ł��BFIXED_Y0 �� FIXED_YP0 �́A
% 0 �� 1 �̃x�N�g���ł��BDECIC �́A����̗v�f���ł������ύX���Ȃ��悤��
% ���܂��BY0(i) �̐���ɕύX��������Ă��Ȃ��ꍇ�AFIXED_Y0(i) = 1 ��
% �ݒ肷�邱�ƂŁA����v�f���Œ肳���悤�Ɏw�肷�邱�Ƃ��ł��A������
% �Ȃ��ꍇ�A0 �Ǝw�肵�܂��BFIXED_Y0 ����̔z��̏ꍇ�A���ׂĂ̗v�f��
% �ύX���\�ł���Ɖ��߂���܂��BFIXED_YP0 �́A���l�Ɉ����܂��B
%
% length(Y0) ���������̗v�f���Œ肷�邱�Ƃ͂ł��܂���B���Ɉˑ����āA
% �������Œ�ł��Ȃ��\��������܂��BY0 �܂��� YP0 �̓���̗v�f���Œ�
% �ł��Ȃ��\��������܂��B�K�v�ȏ�̗v�f���Œ肵�Ȃ����Ƃ������߂��܂��B
% 
% [Y0MOD,YP0MOD] = DECIC(ODEFUN,T0,Y0,FIXED_Y0,YP0,FIXED_YP0,OPTIONS)
% �́AODESET �֐��ō쐬���ꂽ�\���́AOPTIONS �̒l�ɂ��u��������ꂽ
% �ϕ��̋��e�덷�̃f�t�H���g�l���g�p���ď�L�̂悤�Ɍv�Z���܂��B
%
% [Y0MOD,YP0MOD,RESNRM] = DECIC(ODEFUN,T0,Y0,FIXED_Y0,YP0,FIXED_YP0...)
% �́AODEFUN(T0,Y0MOD,YP0MOD) �̃m������ RESNRM �Ƃ��ďo�͂��܂��B
% �m�������傫������悤�ɂ݂���ꍇ�AOPTIONS ���g�p���Ă�菬���� 
% RelTol (�f�t�H���g�� 1e-3) ���w�肵�Ă��������B
%
%
% �Q�l ODE15I, ODESET, IHB1DAE, IBURGERSODE, FUNCTION_HANDLE.


% Copyright 1984-2006 The MathWorks, Inc.
