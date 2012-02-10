% ODE23S   �᎟�@�ɂ��X�e�B�b�t�Ȕ����������̉�@
%
%   [TOUT,YOUT] = ODE23S(ODEFUN,TSPAN,Y0) �́ATSPAN = [T0 TFINAL] �̂Ƃ��A
%   �������� Y0 �ŁA���� T0 ���� TFINAL �܂Ŕ����������̃V�X�e�� y' = f(t,y) 
%   ��ϕ����܂��B ODEFUN �͊֐��n���h���ł��B�X�J�� T �ƃx�N�g�� Y ��
%   �΂��āAODEFUN(T,Y) �́Af(t,y) �ɑΉ������x�N�g����Ԃ��Ȃ����
%   �Ȃ�܂���B ���̔z�� YOUT �̊e�s�́A��x�N�g�� TOUT �ɕԂ���鎞�Ԃ�
%   �Ή����܂��B ���� T0,T1,...,TFINAL (�P�������܂��͒P������) �ł̉���
%   ���߂邽�߂ɂ́ATSPAN = [T0 T1 ... TFINAL] ���g�p���Ă��������B
%   
%   [TOUT,YOUT] = ODE23S(ODEFUN,TSPAN,Y0,OPTIONS) �́A�f�t�H���g�̐ϕ�
%   �v���p�e�B���AOPTIONS �̒l�Œu�������ĉ����܂��B OPTIONS �͊֐� 
%   ODESET �ō쐬���ꂽ�����ł��B �ڍׂ́AODESET ���Q�Ƃ��Ă��������B 
%   ��ʂɎg�p�����I�v�V�����́A�X�J���̑��΋��e�덷 'RelTol' (�f�t�H���g
%   �ł� 1e-3)�ƁA��΋��e�덷�x�N�g�� 'AbsTol' (�f�t�H���g�ł͂��ׂĂ�
%   �v�f�� 1e-6) �ł��B  
%      
%   ���R�r�s�� df/dy �́A�v�Z�M�����ƌ������ɏd�v�ł��B ODESET ���g�p���� 
%   FJAC(T,Y) �����R�r�A�� df/dy ��Ԃ��ꍇ�́A'jacobian' ���֐��n���h�� 
%   FJAC �ɁA���R�r�A�����萔�̏ꍇ�́A�s�� df/dy �ɐݒ肵�܂��B 
%   'Jacobian' �I�v�V������ݒ肵�Ă��Ȃ��ꍇ (�f�t�H���g)�Adf/dy �́A
%   �L�������ɂ��ߎ�����܂��B ODEFUN(T,[Y1,Y2,...]) ���A
%   [ODEFUN(T,Y1),ODE ...] ���o�͂���悤�� ODE �֐����R�[�f�B���O�A
%   �v���O��������Ă���ꍇ�A'Vectorized' �� 'on' �ɐݒ肵�Ă��������B 
%   df/dy ���X�p�[�X�s��̏ꍇ�A'JPattern' �� df/dy �̃X�p�[�X�p�^�[����
%   �ݒ肵�Ă��������B ���Ȃ킿�Af(t,y) �� i �Ԗڂ̗v�f�� y �� j �Ԗڂ�
%   �v�f�Ɉˑ�����ꍇ�� S(i,j) = 1 �ŁA�����łȂ��ꍇ�� S(i,j) = 0 ��
%   �Ȃ��X�p�[�X�s��ɂȂ�܂��B   
%   
%   ODE23S �́A�����łȂ����ʍs��M������� M*y' = f(t,y) ���������Ƃ�
%   �ł��܂��B ODESET ���g���� 'Mass' �v���p�e�B�Ɏ��ʍs���ݒ肵�܂��B
%   �����̔��������������݂���ꍇ�A�X�p�[�X�s�� M �𗘗p���邱�Ƃ͏d�v
%   �ł��B 'JPattern' �v���p�e�B���g���āAdf/dy �̃X�p�[�X�p�^�[����
%   �ݒ肷�邩�A�܂��́AJacobian �v���p�e�B���g���āA�X�p�[�X df/dy ��
%   �ݒ肵�܂��B ODE15S ��  ODE23T �́A�񐳑��Ȏ��ʍs����܂ޖ�������
%   ���Ƃ��ł��܂��B  
%   
%   [TOUT,YOUT,TE,YE,IE] = ODE23S(ODEFUN,TSPAN,Y0,OPTIONS...) �́AOPTIONS ��
%   'Events' �v���p�e�B���֐��n���h�� EVENTS �ɐݒ肳��Ă�ꍇ�̉�@��
%   ��L�Ɠ��l�ŁA����ɃC�x���g�֐��ƌĂ΂�� (T,Y) �̊֐��� 0 �ƂȂ�_��
%   ���߂܂��B �e�֐��ɑ΂��āA�ϕ��� 0 �ŏI����ׂ����ǂ����A�����ă[��
%   �N���b�V���O�̕��������ɂȂ邩�ǂ����w�肵�܂��B �����́AEVENTS: 
%   [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y) �ɂ���ĕԂ���� 3 ��
%   �x�N�g���ł��B I �Ԗڂ̃C�x���g�֐��ɑ΂��āAVALUE(I) �́A�ϕ�������
%   �C�x���g�֐��� 0 �ŏI������ꍇ�́A�֐� ISTERMINAL(I)=1 �̒l�ŁA
%   �����łȂ��ꍇ�� 0 �ł��B ���ׂĂ� 0 ���v�Z����� (�f�t�H���g) �ꍇ�́A
%   DIRECTION(I)=0 �ŁA�C�x���g�֐������������_�̂� 0 �ł���ꍇ�� 
%   +1 �ŁA�C�x���g�֐������������_�̂ݗ�_�ł���ꍇ�� -1 �ł��B �o�� 
%   TE �́A�C�x���g���������鎞�Ԃ̗�x�N�g���ł��B YE �̍s�͑Ή�������ŁA
%   �x�N�g�� IE �̃C���f�b�N�X�͂ǂ̃C�x���g���������������w�肵�܂��B  
%
%   SOL = ODE23S(ODEFUN,[T0 TFINAL],Y0...) �́AT0 �� TFINAL �Ԃ̔C�ӂ̓_
%   �ŁA���A�܂��� 1 �����֐����v�Z���邽�߁ADEVAL �Ŏg�p�\�ȍ\���̂�
%   �o�͂��܂��B ODE23S �őI�����ꂽ�X�e�b�v�́A�s�x�N�g�� SOL.x �ɏo��
%   ����܂��B I �ɑ΂��āA�� SOL.y(:,I) �́ASOL.x(I) �ł̉����܂�ł��܂��B 
%   �C�x���g�����o���ꂽ�ꍇ�́ASOL.xe�́A�C�x���g�����������ʒu�������_
%   ����\�������s�x�N�g���ł��B SOL.ye �̗�́A�Ή�������ŁA�x�N�g�� 
%   SOL.ie �̃C���f�b�N�X�́A�ǂ̃C�x���g�������������������܂��B 
%
%   ��
%         [t,y]=ode23s(@vdp1000,[0 3000],[2 0]);   
%         plot(t,y(:,1));
%     �́A�f�t�H���g�̑��Ό덷 1e-3 �ƃf�t�H���g�̐�Ό덷 1e-6 ���e������
%     �g���ăV�X�e�� y' = vdp1000(t,y) �������A���̍ŏ��̗v�f���v���b�g���܂��B
%
%   �Q�l
%     ����ODE�\���o:       ODE15S, ODE23T, ODE23TB, ODE45, ODE23, ODE113
%     �A�I ODE     :       ODE15I
%     options �̎�舵��:  ODESET, ODEGET
%     �o�͊֐�     :       ODEPLOT, ODEPHAS2, ODEPHAS3, ODEPRINT
%     ���̌v�Z     :       DEVAL
%     ODE ��       :       VDPODE, BRUSSODE
%     �֐��n���h�� :       FUNCTION_HANDLE
%
%   ����: 
%     ODE �\���o�̍ŏ��̓��͈����� ODESET �֓n���������̃v���p�e�B��
%     ���߂́AMATLAB 6.0 �ŕύX����Ă��܂��B 
%     �o�[�W���� 5 �̃V���^�b�N�X�͌��݁A�T�|�[�g���Ă��܂����A�V����
%     �@�\�́A�V�����V���^�b�N�X�ł̂ݎg�p�\�ł��B�o�[�W���� 5 �̃w���v��
%     ����ɂ́A���̂悤�ɓ��͂��Ă��������B
%         more on, type ode23s, more off


%   Mark W. Reichelt and Lawrence F. Shampine, 3-22-94
%   Copyright 1984-2005 The MathWorks, Inc.
