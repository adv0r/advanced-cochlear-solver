%ODEXTEND  �����������̏����l���̉����g�����܂�
% 
% SOLEXT = ODEXTEND(SOL,ODEFUN,TFINAL) �́ASOL �Ɋi�[���ꂽ�������
% [SOL.x(1), TFINAL] �܂Ŋg�����܂��BSOL �́AODE �\���o�Ő������ꂽ
% ODE�̉��̍\���̂ł��BODEFUN �͊֐��n���h���ł��B�X�J�� T �Ɨ�x�N�g��
% Y �ɑ΂��āAODEFUN(T,Y) �͔����̗�x�N�g����Ԃ��܂��BODEXTEND �́A
% SOL �𐶐������̂Ɠ���ODE�\���o���g�p���āA����
% SOL.x(end) ����TFINAL�܂Őϕ����邱�Ƃɂ������g�����܂��B
% �f�t�H���g�ł́AODEXTEND �́A �����ϕ��̏��������Ƃ���
% SOL.y(:,end)���g�p���܂��BSOL �̌v�Z�Ɏg�p�����A���֐��A�ϕ���
% �����A�ǉ��̓��͈����́A���̉��̍\���̂̈ꕔ�ɃX�g�A����܂��B
% �����̒l���ς�Ȃ��ꍇ�AODEXTEND�@�ɓn�����K�v�͂���܂���B
% SOL.x(1) �� TFINAL �̊Ԃ̔C�ӂ̓_�Ŋg�����ꂽ����]�����邽�߂ɂ́A
% DEVAL �� SOLEXT ���g�p���Ă��������B 
%
% SOLEXT = ODEXTEND(SOL,ODEFUN,TFINAL,YINIT) �́A��L�̂悤��
% �����܂��BSOL.X(end) �ł̐V�������������Ƃ��āA��x�N�g��
% YINIT ���g�p���āAODE15I���g�p���ē���ꂽ�����g�����邽�߂ɂ́A
% �V���^�b�N�X SOLEXT = ODEXTEND(SOL,ODEFUN,TFINAL,[YINIT,YPINIT]) 
% ���g�p���Ă��������B�����ŁA��x�N�g�� YPINIT �́A���̏�����
% ���֐��ł��B
%
% SOLEXT = ODEXTEND(SOL,ODEFUN,TFINAL,YINIT,OPTIONS) �́AOPTIONS ��
% �w�肳�ꂽ�ϕ��������g�p���āASOL �̌v�Z�Ɏg�p���ꂽ�l��u�������A
% ��L�̂悤�ɉ����܂��BOPTIONS �v���p�e�B�̐ݒ�ɂ��Ă̏ڍׂ́A
% ODESET ���Q�Ƃ��Ă��������B�V���� YINIT ���ݒ肳��Ă��Ȃ��ꍇ�A
% �v���[�X�z���_�Ƃ���YINIT = [] ���g�p���Ă��������B
%
% ��
%      sol=ode45(@vdp1,[0 10],[2 0]); 
%      sol=odextend(sol,@vdp1,20); 
%      plot(sol.x,sol.y(1,:));
% ���̗�ł́A��� [0 10] �ŃV�X�e�� y' = vdp1(t,y) ���������߂ɁA
% ODE45 ���g�p���܂��B���̌�A���� [0 20] �܂Ŋg�����A���̍ŏ��̗v�f��
% �v���b�g���܂��B
%
% ���� SOL, TFINAL, YINIT �ɑ΂���N���X�T�|�[�g:
%     float: double, single
%
% �Q�l 
%     ODE �\���o:         ODE23, ODE45, ODE113, ODE15S, ODE23S, ODE23T, ODE23TB
%     �A�I ODE:           ODE15I
%     �I�v�V�����̈���:   ODESET, ODEGET
%     ���̎��s:           DEVAL
%     �֐��n���h��:       FUNCTION_HANDLE


%   Copyright 1984-2006 The MathWorks, Inc.
