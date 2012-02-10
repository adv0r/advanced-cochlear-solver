% ODE23TB  �᎟�@���g�����X�e�B�b�t�Ȕ����������̉�@
%
%   [TOUT,YOUT] = ODE23TB(ODEFUN,TSPAN,Y0) �́ATSPAN = [T0 TFINAL] �̂Ƃ��A
%   �������� Y0 �ŁA���� T0 ���� TFINAL �܂Ŕ����������V�X�e�� y' = f(t,y) 
%   ��ϕ����܂��B ODEFUN �͊֐��n���h���ł��B �X�J�� T �ƃx�N�g�� Y ��
%   �΂��āAODEFUN(T,Y) �� f(t,y) �ɑΉ������x�N�g����Ԃ��Ȃ����
%   �Ȃ�܂���B ���̔z�� YOUT �̊e�s�́A��x�N�g�� TOUT �ɏo�͂����
%   ���ԂɑΉ����܂��B ���� T0,T1,..., TFINAL (�P�������܂��͒P������) 
%   �ł̉������߂邽�߂ɂ́ATSPAN = [T0 T1 ... TFINAL] ���g�p���Ă��������B
%   
%   [TOUT,YOUT] = ODE23TB(ODEFUN,TSPAN,Y0,OPTIONS) �́A�f�t�H���g�̐ϕ�
%   �v���p�e�B�� OPTIONS �̒l�Œu�������ĉ����܂��B OPTIONS �́A�֐� 
%   ODESET �ō쐬���ꂽ�����ł��B �ڍׂ́A�֐� ODESET ���Q�Ƃ��Ă��������B 
%   ��ʂɎg�p�����I�v�V�����́A�X�J���̑��΋��e�덷 'RelTol' (�f�t�H���g
%   �ł� 1e-3) �ƁA��΋��e�덷�x�N�g�� 'AbsTol' (�f�t�H���g�ł� 1e-6) �ł��B 
%   �ꕔ�̉��̐������A�񕉂łȂ���΂ȂȂ��ꍇ�A'NonNegative' �v���p�e�B��
%   �����̐����̃C���f�b�N�X�ɐݒ肷�邽�߂� ODESET ���g�p���Ă��������B 
%   'NonNegative' �v���p�e�B�́A���ʍs�񂪂�����ɑ΂��Ė�������܂��B
%      
%   ���R�r�s�� df/dy �́A�v�Z�M�����ƌ������ɂ����ďd�v�ł��B ODESET ��
%   �g�p���� FJAC(T,Y) �����R�r�A�� df/dy ��Ԃ��ꍇ�́A'jacobian' ��
%   �֐��n���h�� FJAC �ɁA���R�r�A�����萔�̏ꍇ�́A�s�� df/dy �ɐݒ�
%   ���܂��B 'Jacobian' �I�v�V������ݒ肵�Ă��Ȃ��ꍇ (�f�t�H���g)�A
%   df/dy �́A�L�������ɂ��ߎ�����܂��B ODEFUN(T,[Y1,Y2,...]) ���A
%   [ODEFUN(T,Y1),ODE ...] ���o�͂���悤�� ODE �֐����R�[�f�B���O�v��
%   �O��������Ă���ꍇ�A'Vectorized' �� 'on' �ɐݒ肵�Ă��������B 
%   df/dy ���X�p�[�X�s��̏ꍇ�A'JPattern' �� df/dy �̃X�p�[�X�p�^�[����
%   �ݒ肵�Ă��������B ���Ȃ킿�Af(t,y) �� i �Ԗڂ̗v�f�� y �� j �Ԗڂ�
%   �v�f�Ɉˑ�����ꍇ�� S(i,j) = 1 �ŁA�����łȂ��ꍇ�� S(i,j) = 0 ��
%   �X�p�[�X�s��ɂȂ�܂��B  
%   
%   ODE23TB �́A�����łȂ����ʍs�� M(t,y) ������� M(t,y)*y' = f(t,y) ��
%   �����܂��B MASS(T,Y) �����ʍs��̒l���o�͂���ꍇ�AODESET ���g����
%   'Mass' �v���p�e�B�Ɋ֐��n���h�� MASS ��ݒ肵�܂��B���ʍs�񂪒萔��
%   �ꍇ�́A�s��� 'Mass' �I�v�V�����̒l�Ƃ��Ďg�����Ƃ��ł��܂��B ���
%   �ˑ��̎��ʍs��������́A��������̂ɂȂ�܂��B ���ʍs��
%   ��ԕϐ� Y �Ɉˑ������A�֐� MASS ��1�̓��͈��� T �Ƌ��ɌĂяo�����
%   �ꍇ�́A'MStateDependence' �� 'none' �ɐݒ肵�Ă��������B ���ʍs�� 
%   Y �ɏ����ˑ�����ꍇ�́A'MStateDependence' �� 'weak' (�f�t�H���g) �ɁA
%   ���̏ꍇ�́A'strong' �ɐݒ肵�Ă��������B ������̏ꍇ���֐� MASS �́A
%   2�̈��� (T,Y) �Ƌ��ɌĂяo����܂��B �����̔��������������݂���ꍇ�A
%   �X�p�[�X�����͂����肳���邱�ƁA�X�p�[�X M(t,y) ���o�͂����邱�Ƃ�
%   �d�v�Ȃ��Ƃł��B 'JPattern' �v���p�e�B���g���āAdf/dy �̃X�p�[�X
%   �p�^�[����ݒ肷�邩�A�܂���Jacobian �v���p�e�B���g���ăX�p�[�X 
%   df/dy ��ݒ肵�܂��B��ԕϐ��ɋ����ˑ����� M(t,y) �̏ꍇ�A'MvPattern' 
%   ���X�p�[�X�s�� S �ɐݒ肵�Ă��������B �����ŁAS �͔C�ӂ� k �ɑ΂��āA
%   M(t,y) �� (i,k) �v�f�� y �� j �v�f�Ɉˑ�����ꍇ�AS(i,j)  = 1 �ŁA
%   ���̏ꍇ�� 0 �ł���s��ł��B ODE15S �� ODE23T �́A�񐳑��Ȏ��ʍs���
%   �܂ޖ����������Ƃ��ł��܂��B 
%   
%   [TOUT,YOUT,TE,YE,IE] = ODE23TB(ODEFUN,TSPAN,Y0,OPTIONS) �́AOPTIONS ��
%   'Events' �v���p�e�B���֐��n���h�� EVENTS �ɐݒ肳��Ă�ꍇ�A��@��
%   ��L�Ɠ��l�ŁA����ɃC�x���g�֐��ƌĂ΂�� (T,Y) �̊֐��� 0 �ƂȂ�
%   �_�����߂܂��B �e�֐��ɑ΂��āA�ϕ��� 0 �ŏI����ׂ����ǂ����A������
%   �[���N���b�V���O�̕��������ɂȂ邩�ǂ����w�肵�܂��B�����́AEVENTS: 
%   [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y) �ɂ���ĕԂ���� 3 ��
%   �x�N�g���ł��B I �Ԗڂ̃C�x���g�֐��ɑ΂��āAVALUE(I) �́A�ϕ�������
%   �C�x���g�֐��� 0 �ŏI������ꍇ�́A�֐� ISTERMINAL(I)=1 �̒l�ŁA
%   �����łȂ��ꍇ�� 0 �ł��B ���ׂĂ� 0 ���v�Z����� (�f�t�H���g) �ꍇ�́A
%   DIRECTION(I)=0 �ŁA�C�x���g�֐������������_�̂� 0 �ł���ꍇ�� 
%   +1 �ŁA�C�x���g�֐������������_�̂ݗ�_�ł���ꍇ�� -1 �ł��B �o�� 
%   TE �́A�C�x���g���������鎞�Ԃ̗�x�N�g���ł��B YE �̍s�͑Ή�������ŁA
%   �x�N�g�� IE �̃C���f�b�N�X�͂ǂ̃C�x���g���������������w�肵�܂��B    
%
%   SOL = ODE23TB(ODEFUN,[T0 TFINAL],Y0...) �́AT0 �� TFINAL �Ԃ̔C��
%   �̓_�ŁA���܂��͈ꎟ���֐����v�Z���邽�߁ADEVAL �Ŏg�p�\�ȍ\���̂�
%   �o�͂��܂��B ODE23TB �őI�����ꂽ�X�e�b�v�́A�s�x�N�g�� SOL.x �ɏo��
%   ����܂��B I �ɑ΂��āA�� SOL.y(:,I) �́ASOL.x(I) �ł̉����܂�ł��܂��B 
%   �C�x���g�����o���ꂽ�ꍇ�́ASOL.xe�́A�C�x���g�����������ʒu������
%   �_����\�������s�x�N�g���ł��B SOL.ye �̗�́A�Ή�������ŁA
%   �x�N�g�� SOL.ie �̃C���f�b�N�X�́A�ǂ̃C�x���g��������������������
%   ���܂��B
%   
%   ��
%         [t,y]=ode23tb(@vdp1000,[0 3000],[2 0]);   
%         plot(t,y(:,1));
%     �́A�f�t�H���g�̑��Ό덷 1e-3 �ƃf�t�H���g�̐�Ό덷 1e-6 ���e������
%     �g���ăV�X�e�� y' = vdp1000(t,y) �������A���̍ŏ��̗v�f���v���b�g���܂��B
%
%   �Q�l
%     ����ODE�\���o:       ODE15S, ODE23S, ODE23T, ODE45, ODE23, ODE113
%     �A�I ODEs    :       ODE15I
%     options �̎�舵��:  ODESET, ODEGET
%     �o�͊֐�     :       ODEPLOT, ODEPHAS2, ODEPHAS3, ODEPRINT
%     ���̌v�Z     :       DEVAL
%     ODE ��       :       VDPODE, FEM1ODE, BRUSSODE
%     �֐��n���h�� :       FUNCTION_HANDLE
%
%   ����: 
%     ODE �\���o�̍ŏ��̓��͈����� ODESET �֓n���������̃v���p�e�B��
%     ���߂́AMATLAB 6.0 �ŕύX����Ă��܂��B 
%     �o�[�W���� 5 �̃V���^�b�N�X�͌��݁A�T�|�[�g���Ă��܂����A�V����
%     �@�\�́A�V�����V���^�b�N�X�ł̂ݎg�p�\�ł��B�o�[�W���� 5 �̃w���v��
%     ����ɂ́A���̂悤�ɓ��͂��Ă��������B
%         more on, type ode23tb, more off


%   Mark W. Reichelt, Lawrence F. Shampine, and Yanyuan Ma, 7-1-97
%   Copyright 1984-2005 The MathWorks, Inc.
