% ODEPHAS3   3 �����ʑ����ʂ� ODE �o�͊֐�
%
% �֐� odephas3 �� 'OutputFcn' �v���p�e�B�Ƃ��� ODE �\���o�ɓn�����Ƃ��A
% ���Ȃ킿�Aoptions = odeset('OutputFcn',@odephas3) �̂Ƃ��A�\���o��
% �e���ԃX�e�b�v���� ODEPHAS3(T,Y,'') ���Ăяo���܂��B�֐� ODEPHAS3 �́A
% �v�Z���ꂽ�ʂ�ɓn�������̍ŏ��� 3 �̗v�f���A���͈̔͂Ƀ_�C�i�~�b�N
% �ɒ��߂��Ȃ���v���b�g���܂��B����� 3 �̗v�f���v���b�g����ɂ́AODE 
% �\���o�ɓn����� 'OutputSel' �ɃC���f�b�N�X���w�肵�Ă��������B
%   
% �ϕ��̊J�n���ɁA�\���o�͏o�͊֐������������邽�߂ɁA
% ODEPHAS3(TSPAN,Y0,'init') ���Ăяo���܂��B���̃x�N�g���� Y �ł���V����
% ���ԓ_�ւ̐ϕ��X�e�b�v�̌�ŁA�\���o�� STATUS = ODEPHAS3(T,Y,'')
% ���Ăяo���܂��B�\���o�� 'Refine' �v���p�e�B�� 1 ���傫���ꍇ (ODESET ��
% �Q��) �́AT �͂��ׂĂ̐V�����o�͎��Ԃ��܂ޗ�x�N�g���ŁAY �͑Ή�����
% ��x�N�g������Ȃ�z��ł��BSTOP �{�^����������Ă���� STATUS �̏o�͒l�� 
% 1 �ŁA�����łȂ���� 0 �ł��B�ϕ����I������ƁA�\���o�� 
% ODEPHAS3([],[],'done') ���Ăяo���܂��B
%
% �Q�l �F ODEPLOT, ODEPHAS2, ODEPRINT, ODE45, ODE15S, ODESET.


%   Copyright 1984-2006 The MathWorks, Inc.