% ODEPLOT   ODE �o�͊֐�
%
% �֐� 'odeplot' ���A'OutputFcn' �v���p�e�B�Ƃ��� ODE �\���o�ɓn�����Ƃ��A
% ���Ȃ킿�Aoptions = odeset('OutputFcn',@odeplot) �̂Ƃ��A�\���o�͎���
% �X�e�b�v���ɁAODEPLOODEPLOT(T,Y,'') ���Ăяo���܂��B�֐� ODEPLOT �́A
% �v�Z�̎��s���ɓn���ꂽ���̂��ׂĂ̗v�f���A�v���b�g�̎��͈̔͂��_�C�i�~�b�N
% �ɒ��߂��āA�v���b�g���܂��B����̗v�f�݂̂��v���b�g����ɂ́AODE �\���o��
% �n����� 'OutputSel' �v���p�e�B�ɃC���f�b�N�X���w�肵�Ă��������BODEPLOT �́A
% �o�͈����Ȃ��ł́A�\���o�̃f�t�H���g�̏o�͊֐��ł��B
%   
% �ϕ��̊J�n���ɁA�\���o�͏o�͊֐������������邽�߂ɁA
% ODEPLOT(TSPAN,Y0,'init') ���Ăяo���܂��B���̃x�N�g���� Y �ł��鎞�ԓ_ 
% T �ւ̐ϕ��X�e�b�v�̌�ŁA�\���o�́ASTATUS = ODEPLOT(T,Y,'') ���Ă�
% �o���܂��B�\���o�� 'Refine' �v���p�e�B�� 1 ���傫���ꍇ (ODESET ��
% �Q��) �́AT �͂��ׂĂ̐V�����o�͎��Ԃ��܂ޗ�x�N�g���ŁAY �͑Ή�����
% ��x�N�g������Ȃ�z��ł��BSTOP �{�^����������Ă���� STATUS �̏o�͒l�� 
% 1 �ŁA�����łȂ���� 0 �ł��B�ϕ����I������ƁA�\���o�� ODEPLOT([],[],'done') 
% ���Ăяo���܂��B
%   
% �Q�l �F ODEPHAS2, ODEPHAS3, ODEPRINT, ODE45, ODE15S, ODESET.


%   Copyright 1984-2006 The MathWorks, Inc.
