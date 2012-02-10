% DDESD  ��ʓI�Ȓx�������x����������� (DDE) �̉�@
%
%   SOL = DDESD(DDEFUN,DELAYS,HISTORY,TSPAN) �́ADDE 
%   y'(t) = f(t,y(t),y(d(1)),...,y(d(k))) �̃V�X�e����ϕ����܂��B�x��
%   d(j) �́At �� y(t) �Ɉˑ����܂��BDDEFUN �� DELAYS �́A�֐��n���h���ł��B
%   DELAYS(T,Y) �́A�x�� d(j) �̗�x�N�g����Ԃ��Ȃ���΂Ȃ�܂���BDDESD �́A
%   min(d(j),t) ���g�p���邱�ƂŁA�K�v���� d(j) <= t ��ۏ؂��܂��B�֐� 
%   DDEFUN(T,Y,Z) �́Af(t,y(t),y(d(1)),...,y(d(k))) �ɑΉ������x�N�g����
%   �Ԃ��Ȃ���΂Ȃ�܂���B���� t �ɂ�����X�J�� T �ł� DDEFUN �� DELAYS 
%   �ւ̌Ăяo���ɂ����āA��x�N�g�� Y �� y(t) ���ߎ����A�� Z(:,j) ��
%   DELAYS(T,Y) �̗v�f j �Ƃ��ė^����ꂽ�x�� d(j) �ɑ΂��� y(d(j)) ��
%   �ߎ����܂��BDDE �́AT0 < TF �� TSPAN = [T0 TF] �̏ꍇ�ATO ���� TF �܂�
%   �ϕ�����܂��Bt <= T0 �ł̉��́A3 �̕��@�̂����ꂩ�ɂ���� HISTORY ��
%   �w�肳��܂��BHISTORY �͊֐��n���h���ł��B�����ŁA�X�J�� T �ɑ΂��āA
%   HISTORY(T) �́A��x�N�g�� y(t) ��Ԃ��܂��By(t) ���萔�̏ꍇ�AHISTORY ��
%   ���̗�x�N�g���ɂȂ�܂��BDDESD �ւ̌Ăяo���� T0 �ւ̑O�̐ϕ��ɑ���
%   �ꍇ�AHISTORY �́A�Ăяo������̉� SOL �ɂȂ�܂��B
%
%   DDESD �́A[T0,TF] �ɂ����ĘA���̉��𐶐����܂��B���́ADDESD �̏o��
%   SOL �Ɗ֐� DEVAL: YINT = DEVAL(SOL,TINT) ���g���ē_ TINT �Ŏ��s����
%   �܂��B�o�� SOL �͂��̂悤�Ȃ��\���̂ł��B
%       SOL.x  -- DDESD �őI���������b�V��
%       SOL.y  -- SOL.x �̃��b�V���|�C���g�� y(t) ���ߎ�
%       SOL.yp -- SOL.x �̃��b�V���|�C���g�� y'(t) ���ߎ�
%       SOL.solver -- 'ddesd'
%
%   SOL = DDESD(DDEFUN,DELAYS,HISTORY,TSPAN,OPTIONS) �́ADDESET �֐���
%   �쐬���ꂽ�\���� OPTIONS ���̒l�Œu��������ꂽ�f�t�H���g�p�����[�^��
%   ��q�̂悤�ɉ������߂܂��B�ڍׂɂ��ẮADDESET ���Q�Ƃ��Ă��������B
%   ��ʂɗp������I�v�V�����́A�X�J���̑��΋��e�덷 'RelTol' (�f�t�H���g�� 
%   1e-3) �ƁA��΋��e�덷 'AbsTol' (�f�t�H���g�ł́A���ׂĂ̗v�f�� 1e-6) ��
%   �x�N�g���ł��B
%
%   ���̏����l�̃f�t�H���g�́AT0 �ł� HISTORY �ŕԂ����l�ł��B�قȂ�
%   �����l�́A'InitialY' �v���p�e�B�̒l�Ƃ��ė^���邱�Ƃ��ł��܂��B
%
%   OPTIONS ���� 'Events' �v���p�e�B���֐��n���h�� EVENTS �ɐݒ肷�邱�Ƃ�
%   DDESD �́A��q�̂悤�ɉ������߂āA�C�x���g�֐� 
%   g(t,y(t),y(d(1)),...,y(d(k))) �� 0 �ɂȂ�Ƃ���������܂��B�e�֐���
%   �����āA�ϕ��� 0 �ŏI������A�܂��[���N���b�V���O���ǂ̕����ɂȂ邩��
%   �w�肵�܂��BEVENTS: [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y,Z) ��
%   3 �̃x�N�g����Ԃ��܂��BI �Ԗڂ̃C�x���g�֐� VALUE(I) �͊֐��l�ł��B
%   �ϕ������̃C�x���g�֐��� 0 �ŏI������ꍇ�AISTERMINAL(I) = 1 �ŁA
%   �����łȂ��ꍇ�́A0 �ɂȂ�܂��B���ׂĂ� 0 ���v�Z���ꂽ�ꍇ (�f�t�H���g)
%   �� DIRECTION(I) = 0 �ŁA�C�x���g�֐������������Ƃ���̂� 0 �̏ꍇ�� +1�A
%   �C�x���g�֐������������Ƃ���̂� 0 �̏ꍇ�� -1 �ł��B�t�B�[���h SOL.xe �́A
%   �C�x���g�������������_�̍s�x�N�g���ł��BSOL.ye �̗�͉��ɑΉ����ASOL.ie ��
%   �x�N�g���́A�C�x���g�����������ӏ��������܂��B
%
%   ���ׂĂ̒x���֐��� d(j) = t - tau_j �̌`�������ꍇ�A���� DELAYS �́A
%   �萔�x�N�g�� DELAYS(j) = tau_j �ɐݒ�ł��܂��B���̌`���̒x���֐���
%   �����āADDESD �́ADDE23 �̂悤�ɐ������g���܂��B
%   
%   �� 
%         sol = ddesd(@ddex1de,@ddex1delays,@ddex1hist,[0, 5]);
%     �́A�֐� ddex1delays �Ŏw�肳�ꂽ�x���ƁAddex1de �Ōv�Z���ꂽ
%     ����������������� [0, 5] �� DDE �����߂܂��B���� history ��
%     �֐� ddex1hist �� t <= 0 �ɑ΂��Ď��s����܂��B
%     ���́A[0 5] ���� 100 �_�̓��Ԋu�ȓ_�Ŏ��s����܂��B
%         tint = linspace(0,5);
%         yint = deval(sol,tint);
%     �v���b�g����ɂ́A���̂悤�ɂ��܂��B
%         plot(tint,yint);
%     ���̖��́A�萔�x�����܂݂܂��BDDE23 �̃w���v�Z�N�V�����ƁA�� DDEX1 
%     �́ADDE23 ���g���Ă��̖����ǂ̂悤�ɉ����̂��������܂��B
%     �x�������������̗�ɂ��ẮADDEX2 �� DDEX3 ���Q�Ƃ��Ă��������B
%
%   ���� TSPAN, HISTORY �ƁADELAYS(T,Y) �̌��ʂ̃N���X�T�|�[�g:
%   and DDEFUN(T,Y,Z):
%     float: double, single
%
%   �Q�l DDE23, DDESET, DDEGET, DEVAL.


%   Copyright 1984-2006 The MathWorks, Inc.
