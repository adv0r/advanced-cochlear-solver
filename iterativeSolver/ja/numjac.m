% NUMJAC �֐� F(T,Y)�� ���R�r�A�� dF/dY �𐔒l�I�Ɍv�Z
%
%   [DFDY,FAC] = NUMJAC(F,T,Y,FTY,THRESH,FAC,VECTORIZED) �́A�֐� F(T,Y) ��
%   ���R�r�A���𐔒l�I�Ɍv�Z���A�t���s�� DFDY �Ƃ��Č��ʂ�Ԃ��܂��BF �́A
%   �֐��n���h���ł��B�X�J�� T �Ɨ�x�N�g�� Y �ɑ΂��āAF(T,Y) �́A��
%   �x�N�g����Ԃ��Ȃ���΂Ȃ�܂���BT �͓Ɨ��ϐ��ŁAY �͏]���ϐ���
%   �܂݂܂��B�x�N�g�� FTY �́A(T,Y) �ŕ]�����ꂽ F �ł��B��x�N�g�� 
%   THRESH �́AY �ɑ΂���L�Ӑ��̂������l��^���܂��B���Ȃ킿�A
%   abs(Y(i)) < THRESH(i) �����v�f Y(i) �̐��m�Ȓl�͏d�v�ł͂���܂���B
%   THRESH �̂��ׂĂ̗v�f�́A���łȂ���΂Ȃ�܂���B�� FAC �́A��Ɨ̈�ł��B
%   �ŏ��̌Ăяo���ŁAFAC �� [] �ɐݒ肵�܂��B�Ăяo���̊ԂŖ߂�l��ύX
%   ���܂���BVECTORIZED �́ANUMJAC �ɁAF �̕����̒l���P��֐��̌v�Z��
%   �����邩�ۂ���`������̂ł��B���ɁAVECTORIZED=1 �́AF(t,[y1 y2 ...]) �� 
%   [F(t,y1) F(t,y2) ...] ��߂��AVECTORIZED=2 �́AF([x1 x2 ...] ,[y1 y2 ...]) 
%   �� [F(x1,y1) F(x2,y2) ...] ��߂����Ƃ������܂��BODE ���������Ƃ��A
%   ODE �֐��ŁAF(t,[y1 y2 ...]) �� [F(t,y1) F(t,y2) ...] ���o�͂���悤��
%   �R�[�h������Ă���ꍇ�AODESET ���g���āAODE �\���o 'Vectorized' 
%   �v���p�e�B�� 'on' �ɐݒ肵�܂��BBVP ���������Ƃ��AODE �֐��ŁA
%   F([x1 x2 ...],[y1 y2 ...]) �� [F(x1,y1) F(x2,y2) ...] ���o�͂���悤��
%   �R�[�h������Ă���ꍇ�ABVPSET ���g���� BVP �\���o�� 'Vectorized' 
%   �v���p�e�B�� 'on' �ɐݒ肵�܂��B�֐� F ���x�N�g�������邱�ƂŁADFDY ��
%   �v�Z�̃X�s�[�h���オ��\��������܂��B
%   
%   [DFDY,FAC,G] = NUMJAC(F,T,Y,FTY,THRESH,FAC,VECTORIZED,S,G) �́A
%   �X�p�[�X���R�r�s�� DFDY �𐔒l�I�Ɍv�Z���܂��BS �́A0 �� 1 ����\��
%   ������łȂ��X�p�[�X�s��ł��BS(i,j) �̒��� 0 �̒l�́A�֐� F(T,Y) ��
%   i �������A�x�N�g�� Y �� j �����Ɉˑ����Ă��Ȃ����Ƃ������܂� (���Ȃ킿�A
%   DFDY(i,j)=0 �ł�)�B��x�N�g�� G �́A��Ɨ̈�ł��B�ŏ��̌Ăяo���ł́A
%   G �� [] �ɐݒ肵�Ă��������B�Ăяo���̊ԁA�߂�l��ύX���Ȃ��ł��������B
%   
%   [DFDY,FAC,G,NFEVALS,NFCALLS] = NUMJAC(...) �́AdFdy (NFEVALS) ��
%   �֐� F (NFCALLS) �ւ̌Ăяo���񐔂��쐬����Ԃɒl F(T,Y) �̐����o��
%   ���܂��BF ���x�N�g��������Ȃ��ꍇ�ANFCALLS ��NFEVALS �Ɠ������Ȃ�܂��B
%
%   ODE ����ϕ�����ꍇ�A�Δ����W���̋ߎ��ɑ΂��āANUMJAC �͓��ʂ�
%   �J������Ă��܂����A���̃A�v���P�[�V�����ɂ��g�����Ƃ��ł��܂��B
%   ���ɁAF(T,Y) �Ŗ߂����x�N�g���̒����� Y �̒����ƈقȂ�ꍇ�ADFDY ��
%   �����`�ɂȂ�܂��B
%   
% �Q�l COLGROUP, ODE15S, ODE23S, ODE23T, ODE23TB, ODESET.


%   Copyright 1984-2006 The MathWorks, Inc.
