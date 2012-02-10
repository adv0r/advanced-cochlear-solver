% ODE45  �����̎�@�ɂ��X�e�B�b�t�łȂ������������̉�@
%
%   [TOUT,YOUT] = ODE45(ODEFUN,TSPAN,Y0) �́AT0 �� TFINAL �Ԃ̔C�ӂ̓_��
%   �����āA������� Y0 �Ŏ��� T0 ���� TFINAL �܂Ŕ��������� (�V�X�e���n)
%   y' = f(t,y) ��ϕ����܂��B �֐� ODEFUN �͊֐��n���h���ł��B �X�J�� T 
%   �ƃx�N�g�� Y �ɑ΂��āAODEFUN(T,Y) �� f(t,y) �ɑΉ������x�N�g����
%   �Ԃ��Ȃ���΂Ȃ�܂���B ���̔z�� YOUT �̊e�s�́A��x�N�g�� TOUT ��
%   �Ԃ���鎞�ԂɑΉ����܂��B ���� T0,T1,...TFINAL (�P�������܂��͒P��
%   ����) �ł̉������߂邽�߂ɂ́ATSPAN = [T0 T1 ... TFINAL] ���g�p����
%   ���������B
%   
%   [TOUT,YOUT] = ODE45(ODEFUN,TSPAN,Y0,OPTIONS) �́A�f�t�H���g�̐ϕ�
%   �v���p�e�B�� OPTIONS �̒l�Œu�������ĉ����܂��B OPTIONS �́A�֐� 
%   ODESET �ō쐬���ꂽ�����ł��B �ڍׂ́AODESET ���Q�Ƃ��Ă��������B
%   ��ʂɎg�p�����I�v�V�����́A���΋��e�덷�̃X�J�� 'RelTol' (�f�t�H���g
%   �� 1e-3) �ƁA��΋��e�덷�̃x�N�g�� 'AbsTol' (���ׂĂ̐������f�t�H���g
%   �� 1e-6) �ł��B �ꕔ�̉��̐������A�񕉂łȂ���΂ȂȂ��ꍇ�A
%   'NonNegative' �v���p�e�B�������̐����̃C���f�b�N�X�ɐݒ肷�邽�߂� 
%   ODESET ���g�p���Ă��������B
%   
%   ODE45 �́A�����Ȏ��ʍs�� M(t,y) ������� M(t,y)*y' = f(t,y) ��
%   �����܂��B MASS(T,Y) �����ʍs��̒l���o�͂���ꍇ�́AODESET ���g����
%   �֐��n���h�� MASS �� 'Mass'�v���p�e�B��ݒ肵�܂��B���ʍs�񂪒萔��
%   �ꍇ�́A�s��� 'Mass' �I�v�V�����̒l�Ƃ��Ďg���܂��B ���ʍs��
%   ��ԕϐ� Y �Ɉˑ������A�֐� MASS ��1�̓��͈��� T �Ƌ��ɌĂяo�����
%   �ꍇ�́A'MStateDependence' �� 'none' �ɐݒ肵�Ă��������B ODE15S �� 
%   ODE23T �́A�񐳑��Ȏ��ʍs����܂ޖ����������Ƃ��ł��܂��B
%
%   [TOUT,YOUT,TE,YE,IE] = ODE45(ODEFUN,TSPAN,Y0,OPTIONS) �́AOPTIONS ��
%   'Events' �v���p�e�B���֐��n���h�� EVENTS �ɐݒ肳��Ă���ƁA��L��
%   �悤�ɉ����A�C�x���g�֐��ƌĂ΂�� (T,Y) �̊֐��� 0 �ƂȂ�_�����߂܂��B
%   �w�肷��e�֐��ɑ΂��āA0 �Őϕ����I�����邩�ǂ����A����у[��
%   �N���b�V���O�̕����͏d�v�ł��B �����́AEVENTS: 
%   [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y) �ɂ���ĕԂ���� 3 ��
%   �x�N�g���ł��B I �Ԗڂ̃C�x���g�֐��ɑ΂��āAVALUE(I) �́A�֐��̒l�ł��B
%   ���̃C�x���g�֐��Ŋ֐��̒l�� 0 �ɂȂ�ϕ����I������ꍇ�AISTERMINAL(I)=1 
%   �ƂȂ�A���̑��ł� 0 �ɂȂ�܂��B �֐��̒l�����ׂ� 0 �̏ꍇ�ł��A
%   �v�Z���ꂽ�ꍇ�� DIRECTION(I)=0 (�f�t�H���g) �ƂȂ�A�C�x���g�֐���
%   0 ���瑝�����Ă���ꍇ�Ɍv�Z���ꂽ�ꍇ�� DIRECTION(I)=+1�A0 ���猸��
%   ���Ă���ꍇ�Ɍv�Z���ꂽ�ꍇ�� DIRECTION(I)=-1 �ƂȂ�܂��B �o�� 
%   TE �́A�C�x���g���������鎞�Ԃ̗�x�N�g���ł��B YE �̍s�͑Ή�������ŁA
%   �x�N�g�� IE �̃C���f�b�N�X�͂ǂ̃C�x���g�������������𖾋L���܂��B 
%
%   SOL = ODE45(ODEFUN,[T0 TFINAL],Y0...) �́AT0 �� TFINAL �Ԃ̔C�ӂ̓_�ŁA
%   ���A�܂��͈ꎟ���֐����v�Z���邽�߁ADEVAL �Ŏg�p�\�ȍ\���̂��o�͂��܂��B
%   ODE45 �őI�������X�e�b�v�́A�s�x�N�g�� SOL.x �ɏo�͂���܂��B
%   I �ɑ΂��āA�� SOL.y(:,I) �́ASOL.x(I) �ł̉����܂�ł��܂��B �C�x���g��
%   ���o���ꂽ�ꍇ�́ASOL.xe �́A�C�x���g�����������ʒu�������_����\�������
%   �s�x�N�g���ł��BSOL.ye �̗�x�N�g���́A���ɑΉ����A�x�N�g�� SOL.ie ��
%   ���̃C���f�b�N�X�́A�ǂ̃C�x���g�������������������܂��B
%
%   ��    
%         [t,y]=ode45(@vdp1,[0 20],[2 0]);   
%         plot(t,y(:,1));
%     �́A�f�t�H���g�̑��Ό덷 1e-3 �ƃf�t�H���g�̐�Ό덷 1e-6 ���e�v�f��
%     �g���ăV�X�e�� y' = vdp1000(t,y) �������A���̍ŏ��̗v�f���v���b�g���܂��B 
%   
%   ���� TSPAN, Y0 �� ODEFUN(T,Y) �̌��ʂ͂��̃N���X���T�|�[�g���܂�:
%     float: double, single
%
%   �Q�l
%       ����ODE�\���o:      ODE23, ODE113, ODE15S, ODE23S, ODE23T, ODE23TB 
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
%         more on, type ode45, more off


%   Mark W. Reichelt and Lawrence F. Shampine, 6-14-94
%   Copyright 1984-2005 The MathWorks, Inc.
