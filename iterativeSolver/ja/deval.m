% DEVAL  �������������̉����v�Z���܂�
%
% SXINT = DEVAL(SOL,XINT) �́A�x�N�g�� XINT �̂��ׂĂ̗v�f�ɑ΂���
% �������������̉��������܂��BSOL �́A�����l���\���o (ODE45, ODE23, 
% ODE113, ODE15S, ODE23S, ODE23T, ODE23TB, ODE15I)�A���E�l���\���o 
% (BVP4C)�A�܂��͒x������������\���o (DDE23, DDESD) �ŏo�͂����\����
% �ł��BXINT �̗v�f�́A��� [SOl.x(1) SOL.x(end)] ���ɂȂ���΂Ȃ�܂���B
% �e I �ɑ΂��āASXINT(:,I) �́AXINT(I) �ɑΉ�������ł��B 
%
% SXINT = DEVAL(SOL,XINT,IDX) �́A��L�̂悤�Ɏ��s���܂����AIDX �Ƀ��X�g
% ���ꂽ�C���f�b�N�X�������̗v�f�݂̂��o�͂��܂��B   
%
% SXINT = DEVAL(XINT,SOL) �� SXINT = DEVAL(XINT,SOL,IDX) �����p�ł��܂��B
%
% [SXINT,SPXINT] = DEVAL(...) �́A��L�̂悤�ɕ]�����܂����A�����Ԃ���
% �������� 1 �K���֐��̒l���o�͂��܂��B
%
% ODEXTEND ���g�p���Ċg���������_���E�l���A�܂��͏����l���ɑ΂��āA
% ���́A���E�ŕs�A���ł���\��������܂��B���E�_ XC �ɑ΂��āADEVAL �́A
% XC �̍��ƉE����̋Ɍ��̕��ς��o�͂��܂��B�Ɍ��l�𓾂�ɂ́ADEVAL ��
% ���� XINT �� XC �����킸���ɏ������A���邢�́A�킸���ɑ傫���ݒ肵��
% ���������B
%
% ���� SOL �� XINT �̃N���X�T�|�[�g:
%     float: double, single
%
% �Q�l 
%    ODE �\���o:  ODE45, ODE23, ODE113, ODE15S, 
%                 ODE23S, ODE23T, ODE23TB, ODE15I 
%    DDE �\���o:  DDE23, DDESD
%    BVP �\���o:  BVP4C


%   Copyright 1984-2006 The MathWorks, Inc.
