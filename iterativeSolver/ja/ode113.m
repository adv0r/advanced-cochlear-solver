% ODE113  �ώ����ɂ��m���X�e�B�b�t�Ȕ����������̉�@
%
%   [TOUT,YOUT] = ODE113(ODEFUN,TSPAN,Y0) �́ATSPAN = [T0 TFINAL] �̂Ƃ��A
%   �������� Y0 �ŁA���� T0 ���� TFINAL �܂Ŕ����������V�X�e�� y' = f(t,y) 
%   ��ϕ����܂��B ODEFUN �͊֐��n���h���ł��B �X�J�� T �ƃx�N�g�� Y ��
%   �ɑ΂��� ODEFUN(T,Y) �́Af(t,y) �ɑΉ������x�N�g����Ԃ��Ȃ����
%   �Ȃ�܂���B ���̔z�� Y �̊e�s�́A��x�N�g�� TOUT �ɏo�͂���鎞�Ԃ�
%   �Ή����܂��B ����T0,T1,..., TFINAL(�P�������܂��͒P������)�ł̉���
%   ���߂邽�߂ɂ́ATSPAN = [T0 T1 ... TFINAL] ���g�p���Ă��������B
%   
%   [TOUT,YOUT] = ODE113(ODEFUN,TSPAN,Y0,OPTIONS) �́A�f�t�H���g�̐ϕ�
%   �p�����[�^�� OPTIONS �̒l�Œu�������āA�����܂��B OPTIONS �́A�֐� 
%   ODESET �ō쐬���ꂽ�����ł��B �ڍׂ́A�֐� ODESET ���Q�Ƃ��Ă��������B
%   ��ʓI�Ɏg�p�����I�v�V�����́A�X�J���̑��΋��e�덷 'RelTol' 
%   (�f�t�H���g�ł� 1e-3) �ƁA��� ���e�덷�x�N�g�� 'AbsTol' (�f�t�H���g
%   �ł͂��ׂĂ̗v�f�� 1e-6) �ł��B �ꕔ�̉��̐����́A�񕉂łȂ����
%   �Ȃ�Ȃ��ꍇ�A�����̐����̃C���f�b�N�X�ɑ΂��� 'NonNegative' 
%   �v���p�e�B��ݒ肷�邽�߂� ODESET ��p���Ă��������B
%   
%   ODE113 �́A�����Ȏ��ʍs�� M ������� M(t,y)*y' = f(t,y) �������܂��B
%   MASS(T,Y) �����ʍs��̒l���o�͂���ꍇ�́AODESET ���g���Ċ֐��n���h��
%   MASS �ɁA'Mass' �v���p�e�B��ݒ肵�܂��B���ʍs�񂪒萔�̏ꍇ�A�s��́A
%   'Mass' �I�v�V�����̒l�Ƃ��Ďg���A���ʍs�񂪏�ԕϐ� Y �Ɉˑ������A
%   �֐� Mass ��1�̓��͈��� T �Ƌ��ɌĂяo�����ꍇ�A'MStateDependence'
%   �� 'none' �ɐݒ肵�܂��B ���̑��̏ꍇ�A'MStateDependence' �� 'weak'
%   (�f�t�H���g) �܂��́A'strong' ��ݒ肵�܂��B �ǂ���̏ꍇ���A�֐� 
%   MASS ��2�̈��� (T,Y) �Ƌ��ɌĂяo����܂��B ODE15S �� ODE23T �́A
%   ���َ��ʍs��������������܂��B   
%
%   [TOUT,YOUT,TE,YE,IE] = ODE113(ODEFUN,TSPAN,Y0,OPTIONS) �́AOPTIONS �� 
%   'Events' �v���p�e�B���֐� EVENTS �ɐݒ肳��Ă���ꍇ�͏�L�̃C�x���g
%   �֐��ƌĂ΂�� (T,Y) �̊֐����[���ƂȂ�_�����߂܂��B �e�֐��ɑ΂��āA
%   �ϕ��� 0 �ŏI����ׂ����ǂ����A�����ă[���N���b�V���O�̕���������
%   �Ȃ邩�ǂ����w�肵�܂��B �����́A���� EVENTS�A
%   [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y) �ɂ���ďo�͂���� 3 ��
%   �x�N�g���ł��B I �Ԗڂ̃C�x���g�֐��ɑ΂��āAVALUE(I) �́A�֐��̒l�ł��B
%   �ϕ������̃C�x���g�֐��̃[���ŏI������ꍇ�͊֐� ISTERMINAL(I)=1 ��
%   �l�ŁA�����łȂ��ꍇ��0�ł��B ���ׂẴ[�����v�Z�����(�f�t�H���g)�ꍇ�́A
%   DIRECTION(I)=0 �ŁA�C�x���g�֐������������_�̂݃[���ł���ꍇ�� +1
%   �ŁA�C�x���g�֐������������_�̂݃[���ł���ꍇ�� -1 �ł��B �o�� TE �́A
%   �C�x���g���������鎞�Ԃ̗�x�N�g���ł��BYE �̍s�͑Ή�������ŁA�x�N�g�� 
%   IE �̃C���f�b�N�X�͂ǂ̃C�x���g���������������w�肵�܂��B
%
%   SOL = ODE113(ODEFUN,[T0 TFINAL],Y0...) �́AT0 �� TFINAL �Ԃ̔C�ӂ̓_��
%   ��������A�܂���1�����֐����v�Z���邽�߁ADEVAL �Ŏg�p�\�ȍ\���̂�
%   �o�͂��܂��B ODE113 �őI�����ꂽ�X�e�b�v�́A�s�x�N�g�� SOL.x �ɏo��
%   ����܂��B �e I �ɑ΂��āA�� SOL.y(:,I) �́ASOL.x(I) �ł̉����܂��
%   ���܂��B �C�x���g�����o���ꂽ�ꍇ�́ASOL.xe �́A�C�x���g����������
%   �_����\�������s�x�N�g���ł��B SOL.ye �̗�́A�Ή�������ŁA�x�N�g�� 
%   SOL.ie �̃C���f�b�N�X�́A�ǂ̃C�x���g�������������������Ă��܂�
%  
%   ��
%         [t,y]=ode113(@vdp1,[0 20],[2 0]);   
%         plot(t,y(:,1));
%     
%   �́A�f�t�H���g�̑��Ό덷 1e-3 �ƃf�t�H���g�̐�Ό덷 1e-6 ���e������
%   �g���ăV�X�e�� y' = vdp1(t,y) �������A���̍ŏ��̗v�f���v���b�g���܂��B
%  
%   ���� TSPAN�AY0�AODEFUN(T,Y) �̏o�͂ɑ΂���N���X�T�|�[�g:
%     float: double, single
%
%   �Q�l 
%       ���� ODE �\���o:        ODE45, ODE23, ODE15S, ODE23S, ODE23T, ODE23TB
%       �A�I ODE       :        ODE15I
%       OPTIONS �̎�舵��:     ODESET, ODEGET
%       �o�͊֐�       :        ODEPLOT, ODEPHAS2, ODEPHAS3, ODEPRINT
%       ���̌v�Z       :        DEVAL
%       ODE ��         :        RIGIDODE, BALLODE, ORBITODE
%       �֐��n���h��   :        FUNCTION_HANDLE 
%
%   ����: 
%     ODE �\���o�̍ŏ��̓��͈����� ODESET �֓n���������̃v���p�e�B��
%     ���߂́AMATLAB 6.0 �ŕύX����Ă��܂��B 
%     �o�[�W���� 5 �̃V���^�b�N�X�͌��݁A�T�|�[�g���Ă��܂����A�V����
%     �@�\�́A�V�����V���^�b�N�X�ł̂ݎg�p�\�ł��B�o�[�W���� 5 �̃w���v��
%     ����ɂ́A���̂悤�ɓ��͂��Ă��������B
%         more on, type ode113, more off


%   Mark W. Reichelt and Lawrence F. Shampine, 6-13-94
%   Copyright 1984-2005 The MathWorks, Inc.
