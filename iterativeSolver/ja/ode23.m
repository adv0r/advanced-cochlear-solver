% ODE23  �᎟�@�ɂ��m���X�e�B�b�t�����������̉�@
%
%   [TOUT,YOUT] = ODE23(ODEFUN,TSPAN,Y0) �A�� TSPAN = [T0 TFINAL] �́A
%   T0 �� TFINAL �Ԃ̔C�ӂ̓_�ɂ����āA�������� Y0 �Ŏ��� T0 ���� TFINAL 
%   �܂Ŕ��������� (�V�X�e��) y' = f(t,y) ��ϕ����܂��B �֐� ODEFUN ��
%   �֐��n���h���ł��B �X�J�� T �ƃx�N�g�� Y �ɑ΂��āAODEFUN(T,Y) �� 
%   f(t,y) �ɑΉ������x�N�g����Ԃ��Ȃ���΂Ȃ�܂���B ���̔z�� YOUT 
%   �̊e�s�́A��x�N�g�� TOUT �ɕԂ���鎞�ԂɑΉ����܂��B ���� 
%   T0,T1,...TFINAL (�P�������܂��͒P������) �ł̉������߂邽�߂ɂ́A
%   TSPAN = [T0 T1 ... TFINAL] ���g�p���Ă��������B
%   
%   [TOUT,YOUT] = ODE23(ODEFUN,TSPAN,Y0,OPTIONS) �́A�f�t�H���g�̐ϕ�
%   �p�����[�^�� OPTIONS �̒l�Œu�������ĉ����܂��B OPTIONS �́A�֐� 
%   ODESET �ō쐬���ꂽ�����ł��B �ڍׂ́A�֐� ODESET ���Q�Ƃ��Ă��������B
%   ���ʂɎg�p�����I�v�V�����́A�X�J���̑��΋��e�덷 'RelTol' (�f�t�H���g
%   �ł� 1e-3) �ƁA��΋��e�덷�x�N�g�� 'AbsTol' (�f�t�H���g�ł� 1e-6) 
%   �ł��B ���̈ꕔ�̐������A�񕉂łȂ���΂ȂȂ��ꍇ�A���̐����̃C���f�b�N�X
%   �ɑ΂��� 'NonNegative' �v���p�e�B��ݒ肷�邽�߂� ODESET ���g�p���Ă��������B
%   
%   ODE23 �́A�����Ȏ��ʍs�� M ������ M(t,y)*y' = f(t,y) ���������Ƃ�
%   �ł��܂��B MASS(T,Y) �����ʍs��̒l���o�͂���ꍇ�́AODESET ���g����
%   �֐��n���h�� MASS �� 'Mass' �v���p�e�B��ݒ肵�܂��B ���ʍs�񂪒萔��
%   �ꍇ�A�s��́A'Mass' �v���p�e�B�̒l�Ƃ��ė��p����܂��B ���ʍs��
%   ��ԕϐ� Y �Ɉˑ������A�֐� MASS �����͈��� T �Ƌ��ɌĂяo�����ꍇ�́A
%   'MStateDependence' �� 'none' �ɐݒ肵�Ă��������B ODE15S �� ODE23T �́A
%   ���قȎ��ʍs����܂ޖ����������Ƃ��ł��܂��B
%
%   [TOUT,YOUT,TE,YE,IE] = ODE23(ODEFUN,TSPAN,Y0,OPTIONS) �́AOPTIONS ��
%   'Events' �v���p�e�B���֐��n���h�� EVENTS �ɐݒ肳��Ă���ꍇ�̉�@��
%   �C�x���g�֐��ƌĂ΂�� (T,Y) �̊֐��� 0 �ƂȂ�_�����߂܂��B �e�֐���
%   �΂��āA�ϕ��� 0 �ŏI�����邩�ǂ����A�����ă[���N���b�V���O�̕�����
%   �d�v���ǂ����w�肷��K�v������܂��B �����́AEVENTS: 
%   [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y) �ɂ���ĕԂ���� 3 ��
%   �x�N�g���ł��B �e I �Ԗڂ̃C�x���g�֐��ɑ΂��āAVALUE(I) �́A�֐���
%   �l��\���܂��B �ϕ������̃C�x���g�֐��� 0 �ŏI������ꍇ�́A
%   ISTERMINAL(I)=1 �ƂȂ�A�����łȂ��ꍇ�� ISTERMINAL(I)=0 �ƂȂ�܂��B 
%   ���ׂĂ� 0 ���v�Z����� (�f�t�H���g) �ꍇ�́ADIRECTION(I)=0 �ŁA
%   �C�x���g�֐������������_�̂� 0 �ł���ꍇ�� +1 �ŁA�C�x���g�֐���
%   ���������_�̂� 0 �ł���ꍇ�� -1 �ł��B �o�� TE �́A�C�x���g�̔���
%   ���Ԃ̗�x�N�g���ł��B YE �̍s�͑Ή�������ŁA
%   �x�N�g�� IE �̃C���f�b�N�X�͂ǂ̃C�x���g�������������������Ă��܂��B
%
%   SOL = ODE23(ODEFUN,[T0 TFINAL],Y0...) �́AT0 �� TFINAL �Ԃ̔C�ӂ�
%   �_�ɂ�������A�܂���1�����֐����v�Z���邽�߁ADEVAL �Ŏg�p�\�ȍ\���̂�
%   �o�͂��܂��B ODE23 �őI�����ꂽ�X�e�b�v�́A�s�x�N�g�� SOL.x �ɏo��
%   ����܂��B �e I �ɑ΂��āA�� SOL.y(:,I) �́ASOL.x(I) �ł̉����܂��
%   ���܂��B �C�x���g�����o���ꂽ�ꍇ�ASOL.xe �́A�C�x���g�����������ʒu��
%   �����_�ō\�������s�x�N�g���ɂȂ�܂��B SOL.ye �̗�x�N�g���́A����
%   �Ή����A�x�N�g�� SOL.ie �̒��̃C���f�b�N�X�́A�ǂ̃C�x���g����������
%   ���������܂��B
%
%   ��    
%         [t,y]=ode23(@vdp1,[0 20],[2 0]);   
%         plot(t,y(:,1));
%     �́A�f�t�H���g�̑��Ό덷 1e-3 �ƃf�t�H���g�̐�Ό덷 1e-6 ���e������
%     �g���ăV�X�e��y' = vdp1(t,y) �������A���̍ŏ��̗v�f���v���b�g���܂��B
% 
%     ���� TSPAN�AY0�AODEFUN(T,Y) �̏o�͂ɑ΂���N���X�T�|�[�g:
%
%   �Q�l
%       ����ODE�\���o:      ODE45, ODE113, ODE15S, ODE23S, ODE23T, ODE23TB
%       �A�I ODE     :      ODE15I
%       options �̎�舵��: ODESET, ODEGET
%       �o�͊֐�     :      ODEPLOT, ODEPHAS2, ODEPHAS3, ODEPRINT
%       ���̌v�Z     :      DEVAL
%       ODE ��       :      RIGIDODE, BALLODE, ORBITODE
%       �֐��n���h�� :      FUNCTION_HANDLE 
%
%   ����: 
%     ODE �\���o�̍ŏ��̓��͈����� ODESET �֓n���������̃v���p�e�B��
%     ���߂́AMATLAB 6.0 �ŕύX����Ă��܂��B 
%     �o�[�W���� 5 �̃V���^�b�N�X�͌��݁A�T�|�[�g���Ă��܂����A�V����
%     �@�\�́A�V�����V���^�b�N�X�ł̂ݎg�p�\�ł��B�o�[�W���� 5 �̃w���v��
%     ����ɂ́A���̂悤�ɓ��͂��Ă��������B
%         more on, type ode23, more off


%   Mark W. Reichelt and Lawrence F. Shampine, 6-14-94
%   Copyright 1984-2005 The MathWorks, Inc.
