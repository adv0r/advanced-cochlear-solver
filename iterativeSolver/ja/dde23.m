% DDE23  �萔�x������x����������� (DDE) �̉�@
%
%   SOL = DDE23(DDEFUN,LAGS,HISTORY,TSPAN) �́ADDE 
%   y'(t) = f(t,y(t),y(t - tau_1),...,y(t - tau_k)) �̃V�X�e����ϕ����܂��B
%   �萔�̐��̒x�� tau_1,...,tau_k �́A�x�N�g�� LAGS �Ƃ��ē��͂���܂��B
%   DDEFUN �͊֐��n���h���ł��B�֐� DDEFUN(T,Y,Z) �́A
%   f(t,y(t),y(t - tau_1),...,y(t - tau_k)) �ɑΉ������x�N�g�����o��
%   ���Ȃ���΂Ȃ�܂���BDDEFUN �ւ̌Ăяo���ɂ����āA�X�J�� T �́A���݂� 
%   t �ŁA��x�N�g�� Y �� y(t) ���ߎ����A�x�� tau_j = LAGS(J) �ɑ΂��āA
%   �� Z(:,j) �� y(t - tau_j) ���ߎ����܂��BDDE �́AT0 < TF �� 
%   TSPAN = [T0 TF] �̏ꍇ�AT0 ���� TF �ɐϕ�����܂��Bt <= T0 �ł̉��́A
%   3��ނ̂����ꂩ�̕��@�� HISTORY �Ŏw�肳��܂��BHISTORY �́A�֐�
%   �n���h���ŁA�����ŃX�J�� T �̏ꍇ�AHISTORY(T) �͗�x�N�g�� y(t) ��
%   �o�͂��܂��By(t) ���萔�̏ꍇ�AHISTORY �͂��̗�x�N�g���ł��BDDE23 �ւ�
%   ���̌Ăяo�����O�� T0 �̐ϕ��𑱂���ꍇ�AHISTORY �͂��̌Ăяo���̉� 
%   SOL �ɂȂ�܂��B
%
%   DDE23�́A[T0,TF] �ŘA���ȉ��𐶐����܂��B���́ADDE23 �̏o�� SOL ��
%   �֐� DEVAL: YINT = DEVAL(SOL,TINT) ���g���ē_ TINT �ɂ����ĕ]������܂��B
%   �o�� SOL �́A���̗v�f�����\���̂ł��B
%       SOL.x  -- DDE23 �ɂ��I�����ꂽ���b�V��
%       SOL.y  -- SOLx �̃��b�V���_�ɂ����� y(t) �̋ߎ�
%       SOL.yp -- SOLx �̃��b�V���_�ɂ����� y'(t) �̋ߎ�
%       SOL.solver -- 'dde23'
%
%   SOL = DDE23(DDEFUN,LAGS,HISTORY,TSPAN,OPTIONS) �́A�f�t�H���g��
%   �p�����[�^���֐� DDESET �ɂ���č쐬���ꂽ�\���� OPTIONS ���̒l��
%   �u�������āA��L�������܂��B�ڍׂ́ADDESET ���Q�Ƃ��Ă��������B��ʂ�
%   �g�p�����I�v�V�����́A�X�J���̑��΋��e�덷 'RelTol' (�f�t�H���g�ł�
%   1e-3) �ƁA��΋��e�덷�x�N�g�� 'AbsTol' (�f�t�H���g�ł͂��ׂĂ̗v�f��
%   1e-6) �ł��B
%
%   DDE23�́AT0 (history) �����O�̉��̕s�A����AT0 �̌�ł� t �̊��m��
%   �l�ł̕������̌W���̕s�A�����A�����̕s�A���̈ʒu�� 'Jumps' �I�v�V����
%   �̒l�Ƃ��ăx�N�g���ɗ^�����Ă���ꍇ�ɂ����̖����������Ƃ��ł��܂��B 
%
%   �f�t�H���g�ł́A���̏����l�́AT0 �ɂ����� HISTORY �ɂ��o�͂����l�ł��B
%   'InitialY' �v���p�e�B�̒l�ɂ���ẮA�قȂ鏉���l���^������ꍇ������܂��B
%
%   OPTIONS �� 'Events' �v���p�e�B�Ɋ֐��n���h�� EVENTS ���ݒ肳��Ă���
%   �ꍇ�ADDE23 �͏�L�̂悤�ɉ����A�C�x���g�֐� 
%   g(t,y(t),y(t - tau_1),...,y(t - tau_k)) �� 0 �ƂȂ�_�����߂܂��B
%   �w�肷��e�֐��ɑ΂��āA�ϕ��� 0 �ŏI�����邩�ǂ����A�܂��A
%   �[���N���b�V���O�̕����ɈӖ������邩�w�肵�܂��B�����́A
%   EVENTS: [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y,Z) �ŏo�͂���� 
%   3 �̃x�N�g���ł��BI �Ԗڂ̃C�x���g�֐��ɑ΂��āAVALUE(I) �́A
%   �֐��l�ł��B�ϕ������̃C�x���g�֐��� 0 �ŏI������ꍇ�AISTERMINAL(I) = 1 
%   �ŁA�����łȂ��ꍇ�� 0 �ł��B���ׂĂ� 0 ���v�Z����� (�f�t�H���g) 
%   �ꍇ�ADIRECTION(I) = 0 �ŁA�C�x���g�֐������������_�̂� 0 �ɂȂ�
%   �ꍇ�� 1 �ŁA�C�x���g�֐������������_�̂� 0 �ɂȂ�ꍇ�� -1 �ł��B
%   �t�B�[���h SOL.xe �́A�C�x���g���������鎞�Ԃ̍s�x�N�g���ł��BSOL.ye ��
%   �s�͑Ή�������ŁA�x�N�g�� SOL.ie �́A�ǂ̃C�x���g���������������w��
%   ����C���f�b�N�X�ł��B
%   
%   ��    
%         sol = dde23(@ddex1de,[1, 0.2],@ddex1hist,[0, 5]);
%     �́A��� [0, 5] �ɂ����Ēx�ꂪ 1 ����� 0.2 �ŁA�֐� ddex1de ��
%     �v�Z�����x������������������܂��Bhistory �́A�֐� ddex1hist ��
%     t <= 0 �ɑ΂��Čv�Z����܂��B���� [0 5] �� 100 �̓��Ԋu�ȓ_��
%     �����Čv�Z����܂��B 
%         tint = linspace(0,5);
%         yint = deval(sol,tint);
%     �ȉ��ɂ���ăv���b�g���܂��B
%         plot(tint,yint);
%     DDEX1 �́A�T�u�֐����g�������̖�肪�ǂ̂悤�ɃR�[�h������邩��
%     �����܂��B���̗�ɂ��ẮADDEX2 ���Q�Ƃ��Ă��������B  
%
%   ���� TSPAN, LAGS, HISTORY �� DDEFUN(T,Y,Z) �̌��ʂ̃N���X�T�|�[�g:
%     float: double, single
%   
% �Q�l �F DDESET, DDEGET, DEVAL.


%   Copyright 1984-2006 The MathWorks, Inc.
