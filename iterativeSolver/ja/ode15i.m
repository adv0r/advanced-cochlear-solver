% ODE15I  �ώ����@�ɂ�銮�S�A�I�����������̉�@
%
%   [TOUT,YOUT] = ODE15I(ODEFUN,TSPAN,Y0,YP0) �́ATSPAN = [T0 TFINAL] ��
%   �ꍇ�A���������� Y0,YP0 �Ƃ��āA�����������̃V�X�e�� f(t,y,y') = 0 ��
%   ���� T0 ���� TFINAL �܂Őϕ����܂��B �֐� ODE15I �́AODE �ƃC���f�b�N�X 
%   1 �� DAE �������܂��B ���������́A"consistent" (f(T0,Y0,YP0)=0 ���Ӗ�
%   ���܂�) �łȂ���΂Ȃ�܂���B �֐� DECIC ���g���āA����l�ɋ߂�������
%   �Ȃ������������v�Z���܂��B ODEFUN �͊֐��n���h���ł��B �X�J�� T ��
%   �x�N�g�� Y �� YP �ɑ΂��āAODEFUN(T,Y,YP) �́Af(t,y,y') �ɑΉ�����
%   ��x�N�g����Ԃ��Ȃ���΂Ȃ�܂���B ���̔z�� YOUT�̊e�s�́A��x�N�g��
%   TOUT �ŕԂ���鎞�ԂɑΉ�������ł��B����̎��� T0,T1,...,TFINAL 
%   (�P�������A���邢�́A�P������) �ŁA���𓾂邽�߂ɂ́A
%   TSPAN = [T0 T1 ... TFINAL] ���g�p���Ă��������B
%   
%   [TOUT,YOUT] = ODE15I(ODEFUN,TSPAN,Y0,YP0,OPTIONS) �́A�f�t�H���g��
%   �ϕ��v���p�e�B�� OPTIONS �̒l�Œu�������ĉ����܂��B OPTIONS �́A
%   �֐� ODESET �ō쐬���ꂽ�����ł��B �ڍׂ́AODESET ���Q�Ƃ��Ă��������B
%   ��ʂɎg�p�����I�v�V�����́A�X�J���̑��΋��e�덷 'RelTol' (�f�t�H���g��
%   1e-3) �ƁA��΋��e�덷�̃x�N�g�� 'AbsTol' (���ׂĂ̐������f�t�H���g��
%   1e-6) �ł��B
%   
%   ���R�r�s�� df/dy �� df/dy' �́A�M�����ƌ������̂��߂̌���I�ȗv�f�ł��B
%   [DFDY,DFDYP] = FJAC(T,Y,YP) ���s�� df/dy �� df/dy' ��Ԃ��ꍇ�A
%   ODESET ���g���āA'Jacobian' ���֐��n���h�� FJAC �ɐݒ肵�Ă��������B
%   DFDY = [] �̏ꍇ�Adf/dy �͗L�������ŋߎ�����ADFDYP �����l�ł��B
%   'Jacobian' �I�v�V�������ݒ肳��Ȃ� (�f�t�H���g��) �ꍇ�A�����̍s���
%   �L�������ŋߎ�����܂��B
%   ODEFUN(T,[Y1 Y2 ...],YP) �� [ODEFUN(T,Y1,YP) ODEFUN(T,Y2,YP) ...] ��
%   �Ԃ��悤�� ODE �֐����R�[�h������ꍇ�A'Vectorized' �� {'on','off'} 
%   �ɐݒ肵�Ă��������B
%   ODEFUN(T,Y,[YP1 YP2 ...]) �� [ODEFUN(T,Y,YP1) ODEFUN(T,Y,YP2) ...] ��
%   �Ԃ��悤�� ODE �֐����R�[�h������ꍇ�A'Vectorized' �� {'off','on'} 
%   �ɐݒ肵�Ă��������B
%   df/dy �܂��� df/dy' ���X�p�[�X�s��̏ꍇ�A'JPattern' ���X�p�[�X�p�^�[�� 
%   {SPDY,SPDYP} �ɐݒ肵�Ă��������B df/dy �̃X�p�[�X�p�^�[���� f(t,y,yp) 
%   �̐��� i �� y �̐��� j �Ɉˑ�����ꍇ�� SPDY(i,j) = 1�A����ȊO�� 0 ��
%   �Ȃ�X�p�[�X�s�� SPDY �ł��B SPDY = [] ���g�p����� df/dy ���t���s���
%   ���邱�Ƃ������܂��B df/dy' �� SPDYP �ɑ΂��Ă����l�ł��B 'JPattern' ��
%   �f�t�H���g�l�́A{[],[]} �ł��B
%
%   [TOUT,YOUT,TE,YE,IE] = ODE15I(ODEFUN,TSPAN,Y0,YP0,OPTIONS) �́A�֐�
%   �n���h�� EVENTS �ɐݒ肳��� OPTION �� 'Events' �v���p�e�B������ꍇ
%   �̉�@�ŁA�C�x���g�֐��ƌĂ΂�� (T,Y,YP) �̊֐��� 0 �ɂȂ�_������
%   �܂��B �e�֐��ɑ΂��āA�ϕ��� 0 �ŏI����ׂ����ǂ����A�܂��A�[��
%   �N���b�V���O�̕��������ɂȂ邩�ǂ������w�肵�܂��B �����́AEVENTS 
%   �ŕԂ���� 3 �̗�x�N�g�� [VALUE,ISTERMINAL,DIRECTION] = EVENTS(T,Y,YP) 
%   �ł��B I �Ԗڂ̃C�x���g�֐��ɑ΂���: VALUE(I) �́A�֐��̒l�ł��B
%   �ϕ������̃C�x���g�֐��̃[���_�ŏI������ꍇ�AISTERMINAL(I)=1 
%   �ł���A�����łȂ��ꍇ�A0�ł��B���ׂĂ̗�_���v�Z����ꍇ(�f�t�H���g)�A
%   DIRECTION(I)=0, �C�x���g�֐����������Ă���Ƃ���ł̃[���_�̂݌v�Z����ꍇ�A
%   +1, �C�x���g�֐����������Ă���Ƃ���ł̗�_�̂݌v�Z����ꍇ�A-1 �ł��B 
%   �o��TE �́A�C�x���g���N���鎞���̗�x�N�g���ł��B YE �̍s�́A�Ή�
%   ������ł���A�x�N�g�� IE �̃C���f�b�N�X�́A�ǂ̃C�x���g���N���邩
%   �������܂��B
%   
%   SOL = ODE15I(ODEFUN,[T0 TFINAL],Y0,YP0,...) �́AT0 �� TFINAL��
%   �Ԃ̔C�ӂ̓_�ł̉��A�܂��́A����1�K���֐���]�����邽�߂� DEVAL ��
%   �g�p�����\���̂��o�͂��܂��B ODE15I �ɂ��I�����ꂽ�X�e�b�v�́A
%   �s�x�N�g�� SOL.x �ɏo�͂���܂��B �e I �ɑ΂��A�� SOL.y(:,I) �́A
%   SOL.x(I) �ł̉����܂݂܂��B�C�x���g�����o���ꂽ�ꍇ�ASOL.xe �́A
%   �C�x���g�����������_����\�������s�x�N�g���ł��B SOL.ye �̗�́A
%   �Ή�������ł���A�x�N�g�� SOL.ie �̃C���f�b�N�X�́A�ǂ̃C�x���g��
%   �N���������������܂��B
%
%   ��
%         t0 = 1;
%         y0 = sqrt(3/2);
%         yp0 = 0;
%         [y0,yp0] = decic(@weissinger,t0,y0,1,yp0,0);
%   ���̗�ł́A y(t0) �ɑ΂��鏉���l���Œ肷�邽�߂�
%   �⏕�֐� DECIC ���g�p���܂��B
%   Weissinger �̉A�I ODE �ɑ΂���Ay'(t0) �ɑ΂��Ė����̂Ȃ�
%   �����l���v�Z���܂��B �{ ODE �́AODE15I ���g�p���ĉ�����A���l����
%   ��͉��ɑ΂��āA�v���b�g����܂��B
%         [t,y] = ode15i(@weissinger,[1 10],y0,yp0);
%         ytrue = sqrt(t.^2 + 0.5);
%         plot(t,y,t,ytrue,'o');
%
%   �Q�l
%     ���� ODE �\���o:        ODE15S, ODE23S, ODE23T, ODE23TB, ODE45, ODE23, ODE113
%     ��������       :        DECIC
%     �I�v�V�����n���h�����O: ODESET, ODEGET
%     �o�͊֐�       :        ODEPLOT, ODEPHAS2, ODEPHAS3, ODEPRINT
%     ���̕]��       :        DEVAL
%     ODE ��         :        IHB1DAE, IBURGERSODE
%     �֐��n���h��   :        FUNCTION_HANDLE


%   Jacek Kierzenka and Lawrence F. Shampine
%   Copyright 1984-2005 The MathWorks, Inc.
