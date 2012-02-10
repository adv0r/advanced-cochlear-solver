% ODE23T  �����x�̐��x�ŃX�e�B�b�t��ODEs��DAEs���`�����g���ĉ����܂�
%
%   [TOUT,YOUT] = ODE23T(ODEFUN,TSPAN,Y0) �́ATSPAN = [T0 TFINAL] �̂Ƃ��A
%   ������� Y0 �ŁA���� T0 ���� TFINAL �܂Ŕ����������V�X�e�� y' = f(t,y) 
%   ��ϕ����܂��B ODEFUN �͊֐��n���h���ł��B �X�J�� T �ƃx�N�g�� Y ��
%   �΂��āAODEFUN(T,Y) �� f(t,y) �ɑΉ������x�N�g����Ԃ��Ȃ����
%   �Ȃ�܂���B ���̔z�� YOUT �̊e�s�́A��x�N�g�� TOUT �ɏo�͂����
%   ���ԂɑΉ����܂��B ���� T0,T1,..., TFINAL (�P�������܂��͒P������) 
%   �ł̉������߂邽�߂ɂ́ATSPAN = [T0 T1 ... TFINAL] ���g�p���Ă��������B
%   
%   [TOUT,YOUT] = ODE23T(ODEFUN,TSPAN,Y0,OPTIONS) �́A�f�t�H���g�̐ϕ�
%   �p�����[�^�� OPTIONS �̒l�Œu�������āA��L�̂悤�ɉ����܂��B 
%   OPTIONS �́A�֐� ODESET �ō쐬���ꂽ�����ł��B�ڍׂ́A�֐� ODESET ��
%   �Q�Ƃ��Ă��������B ��ʂɎg�p�����I�v�V�����́A�X�J���̑��΋��e
%   �덷 'RelTol' (�f�t�H���g�ł� 1e-3) �ƁA��΋��e�덷�x�N�g�� 'AbsTol' 
%   (�f�t�H���g�ł� 1e-6) �ł��B �ꕔ�̉��̐������A�񕉂łȂ���΂ȂȂ�
%   �ꍇ�A'NonNegative' �v���p�e�B�������̐����̃C���f�b�N�X�ɐݒ�
%   ���邽�߂� ODESET ���g�p���Ă��������B 'NonNegative' �v���p�e�B�́A
%   ���ʍs�񂪂�����ɑ΂��Ė�������܂��B
%   
%   ���R�r�s�� df/dy �́A�v�Z�M�����ƌ������ɕq���ł��B FJAC(T,Y) ��
%   ���R�r�A�� df/dy ��A�s�� df/dy (���R�r�A�����萔�̏ꍇ) ���o�͂���
%   �ꍇ�AODESET ���g���āA'jacobian' �I�v�V�����Ɋ֐��n���h�� FJAC ��
%   �ݒ肵�Ă��������B 'Jacobian' �I�v�V������ݒ肵�Ă��Ȃ��ꍇ (�f�t�H���g)�A
%   df/dy �́A�L�������ɂ�蓾���܂��B ODEFUN(T,[Y1,Y2,...]) ���A
%   [ODEFUN(T,Y1),ODE ...] ���o�͂���悤�� ODE �֐����R�[�h������Ă���
%   �ꍇ�A'Vectorizes' �� 'on' �ɐݒ肵�Ă��������B df/dy ���X�p�[�X�s��
%   �̏ꍇ�A'JPattern' �� df/dy �̃X�p�[�X�p�^�[���ɐݒ肵�Ă��������B
%   ���Ȃ킿�Af(t,y) �� i �Ԗڂ̗v�f�� y �� j �Ԗڂ̗v�f�Ɉˑ�����ꍇ�� 
%   S(i,j) = 1 �ŁA���̏ꍇ 0 �̃X�p�[�X�s�� S �ɂȂ�܂��B   
%
%   ODE23T �́A���ʍs�� M(t,y) ������� M(t,y)*y' = f(t,y) �������܂��B
%   MASS(T,Y) �����ʍs��̒l���o�͂���ꍇ�́AODESET ���g���Ċ֐��n���h��
%   MASS �� 'Mass' �v���p�e�B��ݒ肵�܂��B ���ʍs�񂪒萔�̏ꍇ�A�s��́A
%   'Mass' �I�v�V�����̒l�Ƃ��Ďg���܂��B ��Ԉˑ��̎��ʍs��������
%   �́A��������̂ɂȂ�܂��B ���ʍs�񂪏�ԕϐ� Y �Ɉˑ������A�֐�
%   MASS��1�̓��͈��� T �Ƌ��ɌĂяo�����ꍇ�́A'MStateDependence' ��
%   'none' �ɐݒ肵�Ă��������B ���ʍs�� Y �ɏ����ˑ�����ꍇ�A
%   'MStateDependence' �� 'weak' (�f�t�H���g) �ɁA���̏ꍇ�́A'strong' ��
%   �ݒ肵�Ă��������B ������̏ꍇ���֐� MASS �́A2�̈��� (T,Y) �Ƌ���
%   �Ăяo����܂��B �����̔��������������݂���ꍇ�A�X�p�[�X�����͂�����
%   �����邱�ƁA�X�p�[�X M(t,y) ���o�͂����邱�Ƃ͏d�v�Ȃ��Ƃł��B
%   'JPattern' �v���p�e�B���g���āAdf/dy �̃X�p�[�X�p�^�[����ݒ肷�邩�A
%   �܂��́AJacobian �v���p�e�B���g���āA�X�p�[�X df/dy ��ݒ肵�܂��B
%   ��ԕϐ��ɋ����ˑ����� M(t,y) �̏ꍇ�A'MvPattern' ���X�p�[�X�s�� S 
%   �ɐݒ肵�Ă��������B �����ŁAS �́A�C�ӂ� k �ɑ΂��āAM(t,y) �� (i,k)
%   �v�f�� y �� j �v�f�Ɉˑ�����ꍇ�AS(i,j) = 1 �ŁA���̏ꍇ�� 0 �ł���
%   �s��ł��B   
%
%   ���ʍs�񂪐����ȏꍇ�A���̉��́A���ړI�Ȃ��̂ɂȂ�܂��B ���
%   FEM1ODE, FEM2ODE, BATONODE, BURGERSODE ���Q�Ƃ��Ă��������B
%   M(t0,y0) �������łȂ��ꍇ�A���́A�����㐔������ (DAE) �ɂȂ�܂��B
%   ODE23T �́A�C���f�b�N�X 1 �� DAE �������܂��B DAE �́Ay0 ����v����
%   �ꍇ�A���Ȃ킿�AM(t0,y0)*yp0 = f(t0,y0) �𖞂��� yp0 �����݂���Ƃ�
%   �̂݁A���������܂��B ODESET ���g���� 'MassSingular' �ɁA'yes','no',
%   'maybe' �̂����ꂩ��ݒ肷�邱�Ƃ��ł��܂��B 'maybe' ���f�t�H���g�ŁA
%   M(t0,y0) �������ł��邩�ۂ��̃`�F�b�N�����܂��B 'InitialSlope' 
%   �v���p�e�B�̒l�Ƃ��āAyp0 ��^���܂��B �f�t�H���g�́A�[���x�N�g���ł��B
%   y0 �� yp0 �ɖ��������݂���ꍇ�AODE23T �͐���l�Ƃ��Ă�������舵���A
%   ����ɋ߂������̂Ȃ��l���v�Z���悤�Ƃ��܂��B �����āA���������܂��B
%   HB1DAE �܂��� AMP1DAE �̗����Q�Ƃ��Ă��������B
%
%   [TOUT,YOUT,TE,YE,IE] = ODE23T(ODEFUN,TSPAN,Y0,OPTIONS) �́AOPTIONS ��
%   'Events' �v���p�e�B���֐��n���h�� EVENTS �ɐݒ肳��Ă�ꍇ�͏�L��
%   �悤�ɉ����A�C�x���g�֐��ƌĂ΂�� (T,Y) �̊֐��� 0 �ƂȂ�_�����߂܂��B
%   �w�肷��e�֐��ɑ΂��āA�ϕ��� 0 �ŏI�����邩�ǂ����A����у[��
%   �N���b�V���O�̕����͏d�v�ł��B �����́AEVENTS: 
%   [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y) �ɂ���ĕԂ���� 3 ��
%   �x�N�g���ł��B I �Ԗڂ̃C�x���g�֐��ɑ΂��āAVALUE(I) �́A�ϕ�������
%   �C�x���g�֐��� 0 �ŏI������ꍇ�́A�֐� ISTERMINAL(I)=1 �̒l�ŁA
%   �����łȂ��ꍇ�� 0 �ł��B ���ׂĂ� 0 ���v�Z����� (�f�t�H���g) �ꍇ�́A
%   DIRECTION(I)=0 �ŁA�C�x���g�֐������������_�̂� 0 �ł���ꍇ�� 
%   +1 �ŁA�C�x���g�֐������������_�̂ݗ�_�ł���ꍇ�� -1 �ł��B �o�� 
%   TE �́A�C�x���g���������鎞�Ԃ̗�x�N�g���ł��B YE �̍s�͑Ή�������ŁA
%   �x�N�g�� IE �̃C���f�b�N�X�͂ǂ̃C�x���g���������������w�肵�܂��B  
%
%   SOL = ODE23T(ODEFUN,[T0 TFINAL],Y0...) �́AT0 �� TFINAL �Ԃ̔C��
%   �̓_�ŁA�����v�Z���邽�߁ADEVAL �Ŏg�p�\�ȍ\���̂��o�͂��܂��B
%   ODE23T �őI�����ꂽ�X�e�b�v�́A�s�x�N�g�� SOL.x �ɏo�͂���܂��B
%   I �ɑ΂��āA�� SOL.y(:,I) �́ASOL.x(I) �ł̉����܂�ł��܂��B 
%   �C�x���g�����o���ꂽ�ꍇ�́ASOL.xe�́A�C�x���g�����������ʒu������
%   �_����\�������s�x�N�g���ł��B SOL.ye �̗�́A�Ή�������ŁA
%   �x�N�g�� SOL.ie �̃C���f�b�N�X�́A�C�x���g�������������̂��ǂꂩ��
%   �����Ă��܂��B�^�[�~�i���C�x���g�����o�����ꍇ�ASOL.x(end) �́A
%   �C�x���g�����������ʒu�ł̃X�e�b�v�̏I�����܂�ł��܂��B 
%   �C�x���g�̐��m�Ȉʒu�́ASOL.xe(end) �ɕ񍐂���܂��B
%
%   ��
%         [t,y]=ode23t(@vdp1000,[0 3000],[2 0]);   
%         plot(t,y(:,1));
%     �́A�f�t�H���g�̑��Ό덷 1e-3 �ƃf�t�H���g�̐�Ό덷 1e-6 ���e������
%     �g���ăV�X�e�� y' = vdp1000(t,y) �������A���̍ŏ��̗v�f���v���b�g���܂��B
%
%   �Q�l
%     ����ODE�\���o:        ODE15S, ODE23S, ODE23TB, ODE45, ODE23, ODE113
%     �A�I ODE     :        ODE15I
%     options �̎�舵��:   ODESET, ODEGET
%     �o�͊֐�     :        ODEPLOT, ODEPHAS2, ODEPHAS3, ODEPRINT
%     ���̌v�Z     :        DEVAL
%     ODE ��       :        VDPODE, FEM1ODE, BRUSSODE, HB1DAE
%     �֐��n���h�� :        FUNCTION_HANDLE
%
%   ����: 
%     ODE �\���o�̍ŏ��̓��͈����� ODESET �֓n���������̃v���p�e�B��
%     ���߂́AMATLAB 6.0 �ŕύX����Ă��܂��B 
%     �o�[�W���� 5 �̃V���^�b�N�X�͌��݁A�T�|�[�g���Ă��܂����A�V����
%     �@�\�́A�V�����V���^�b�N�X�ł̂ݎg�p�\�ł��B�o�[�W���� 5 �̃w���v��
%     ����ɂ́A���̂悤�ɓ��͂��Ă��������B
%         more on, type ode23t, more off


%   Mark W. Reichelt, Lawrence F. Shampine, Yanyuan Ma, and Jacek Kierzenka
%   12-18-97
%   Copyright 1984-2005 The MathWorks, Inc.
