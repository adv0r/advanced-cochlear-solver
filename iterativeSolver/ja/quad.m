% QUAD   ���l�ϕ��A�K�� Simpson ����
%
%   Q = QUAD(FUN,A,B) �́A�K�����J�[�V�u�� Simpson ���ϖ@���g���āA1.e-6 
%   �̌덷�ȓ��ŁAA ���� B �܂ł̃X�J���l�̊֐� FUN �̐ϕ����ߎ����悤��
%   ���܂��BFUN �͊֐��n���h���ł��B�֐� Y=FUN(X) �́A�x�N�g���̈��� X ��
%   �󂯓���AX �̊e�v�f�Ŏ��s������ϕ��֐��̃x�N�g���̌��� Y ��Ԃ��܂��B
%
%   Q = QUAD(FUN,A,B,TOL) �́A�f�t�H���g�� 1.e-6 �̑���ɐ�΋��e�덷 
%   TOL ���g�p���܂��BTOL �̒l��傫������ƁA�֐��̌v�Z�񐔂�����A����
%   �ɂȂ�܂����A���x�͒ቺ���܂��BMATLAB 5.3 �� QUAD �֐��́A�M������
%   �Ⴂ�A���S���Y���𗘗p���Ă���A�f�t�H���g�̋��e�덷�� 1.e-3 �ł����B
%
%   Q = QUAD(FUN,A,B,TOL,TRACE) �́A���� TRACE ���ꍇ�A�J��Ԃ��̊ԁA
%   [fcnt a b-a Q] �̒l��\�����܂��BTOL �̃f�t�H���g�l���擾����ɂ́A
%   �v���[�X�z���_�[�Ƃ��� [] ���g�p���Ă��������B
%
%   [Q,FCNT] = QUAD(...) �́A�֐��̎��s�񐔂�Ԃ��܂��B
%
%   �x�N�g���������g���Čv�Z�ł���悤�ɁAFUN �̒�`�̒��ŁA�z�񉉎Z�q .*, 
%   ./, .^ ���g�p���Ă��������B
%
%   ���� :
%   �֐� QUADL �́A�����x�ƃX���[�Y�Ȕ�ϕ��֐��ɂ��A�������I�Ȍv�Z
%   �ɂȂ�\��������܂��B
%   �֐� QUADV �́A�z��l FUN �ɑ΂��� QUAD ���x�N�g�������܂��B
%
%   ��:
%      Q = quad(@myfun,0,2);
%   ������ myfun.m �́A���� M-�t�@�C���֐��ł��B
%      %-------------------%
%      function y = myfun(x)
%      y = 1./(x.^3-2*x-5);
%      %-------------------%
%
%   ���邢�́A�萔�̃p�����[�^���g�p���܂��B
%      Q = quad(@(x)myfun2(x,5),0,2);
%   �����ŁAmyfun2 �́A���� M-�t�@�C���֐��ł��B
%      %----------------------%
%      function y = myfun2(x,c)
%      y = 1./(x.^3-2*x-c);
%      %----------------------%
%
%   ���� A, B �� FUN �̏o�͂̃N���X�T�|�[�g: 
%      float: double, single
%
%   �Q�l QUADV, QUADL, DBLQUAD, TRIPLEQUAD, TRAPZ, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc. 
