% BVPINIT  BVP4C �p�̏���������s���܂��B
% 
% SOLINIT = BVPINIT(X,YINIT) �́A��ʓI�Ȋ��ŁABVP4C �p�̏���������s��
% �܂��BBVP �́A��� [a,b] �ŉ�����܂��B�x�N�g�� X �́AX(1) = a, X(end) = b
% �̂悤�� a �� b ���w�肵�܂��B�K�؂ȃ��b�V���ɑ΂��鐄��ɂ��Ȃ�܂��B
% BVP4C �́A���̃��b�V������@�Ɏg���܂��B����ŁAx = logspace(a,b,10) ��
% �悤�Ȑ���ł��\���ł����A���G�ȏꍇ�́A���b�V���_�́A�����}���ɕω�����
% �ꏊ�ɐݒ肵�Ȃ���΂Ȃ�܂���B
%
% X �͏����ł���K�v������܂��B2 �_ BVP �ɂ����ẮAX �̗v�f�͋�ʂ���A
% a < b �̏ꍇ�AX(1) < X(2) < ... < X(end) �̂悤�ɏ����t�����Ă���
% �K�v������܂��B���_ BVP �̏ꍇ�́A[a,b] �ɂ����Ă������̋��E������
% ����܂��B��ʓI�ɁA�����̓_�͋��E��\�킵�A[a,b] �̈�ɂ����Ď��R��
% ��������܂��BBVPINIT �͗̈�ɑ΂��č�����E (a ���� b)�ɗ^�����A
% �C���f�b�N�X�� 1 ����J�n���܂��B���E�͏������b�V�� X �� double �̗v�f��
% �w��ł��܂��BBVPINIT �́A1 �߂̗v�f��̈� k �̉E�I�_�A������̈� 
% k+1 �̍��I�_�Ƃ��ĉ��߂��܂��BTHREEBVP �́A3�_ BVP �̗�ł��B
% 
% YINIT �́A���ɑ΂��鐄��ł��B���̐���ɑ΂��āA�����������Ƌ��E������
% �v�Z�ł��Ȃ���΂Ȃ�܂���BYINIT �́A�x�N�g���A�܂��́A�֐��n���h����
% �����ꂩ�ɂȂ�܂��B
% 
% �x�N�g���F YINIT(i) �́AX ���̂��ׂẴ��b�V���_�ł̉��� i �Ԗڂ�
%            �v�f Y(i,:) �̒萔����ł��B
%
% �֐�: YINIT �́A�X�J�� x �̊֐��ł��B���Ƃ��΁A��� [a,b] �̔C��
%       �̒l x �ɑ΂��āAyfun(x) ���A�� y(x) �ɑ΂��鐄���߂��ꍇ�A
%       solinit = bvpinit(x,@yfun) ���g���܂��B
%     
% SOLINIT = BVPINIT(X,YINIT,PARAMETERS) �́ABVP �����m�p�����[�^���܂�
% ���Ƃ��Ӗ����Ă��܂��B����́A�x�N�g�� PARAMETERS �̒��̂��ׂĂ�
% �p�����[�^�ɑ΂��ėp�ӂ���܂��B
%
% SOLINIT = BVPINIT(SOL,[ANEW BNEW]) �́A��� [a,b] ��̉� SOL ����A
% ��� [ANNEW,BNEW] ��ł̏���������쐬���܂��B�V������Ԃ́A
% ANEW <= a < b <= BNEW�A�܂��́AANEW >= a > b >= BNEW �̂悤�ɁA���
% �傫���Ȃ���΂Ȃ�܂���B�� SOL �́A�V������ԂɊO�}����܂��B����
% ����ꍇ�ASOL ���� PARAMETERS �́A SOLINIT ���g���܂��B
% ���m�p�����[�^�ɑ΂��āA�قȂ鐄���^����ꍇ�A
% SOLINIT = BVPINIT(SOL,[ANEW BNEW],PARAMETERS) ���g�p���Ă��������B
%
% �Q�l  BVPGET, BVPSET, BVP4C, DEVAL, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc.
