% QUADL  ���l�ϕ��A�K�� Lobatto ���ϖ@
% 
%   Q = QUADL(FUN,A,B) �́A�����̍ċA�K�����ϖ@���g���āA1.e-6 �̌덷���ŁA
%   A ���� B �܂ŁA�X�J���l�̊֐� FUN �̐ϕ����ߎ����悤�Ƃ��܂��BFUN ��
%   �֐��n���h���ł��B�֐� Y = FUN(X) �́A�x�N�g���̈��� X ���󂯓���A
%   X �̊e�v�f�Ŏ��s������ϕ��֐��̃x�N�g���̌��� Y ��Ԃ��܂��B
%
%   Q = QUADL(FUN,A,B,TOL) �́A�f�t�H���g�� 1.e-6 �̑���� TOL ����
%   �덷���e�͈͂Ƃ��Ďg�p���܂��BTOL �̒l��傫������ƁA�֐��̌v�Z��
%   ������A�����ɂȂ�܂����A���x�͒ቺ���܂��B
%
%   Q = QUADL(FUN,A,B,TOL,TRACE) �́A���� TRACE ���ꍇ�A�J��Ԃ��̊ԁA
%   [fcnt a b-a Q] �̒l��\�����܂��BTOL �̃f�t�H���g�l�𓾂�ɂ́A
%   �v���[�X�z���_�[�Ƃ��� [] ���g�p���Ă��������B
%
%   [Q,FCNT] = QUADL(...) �́A�֐��v�Z�̉񐔂��o�͂��܂��B
%
%   �x�N�g�������Ƌ��Ɍv�Z�ł���悤�ɁAFUN �̒�`�̒��ŁA�z�񉉎Z�q .*, 
%   ./, .^ ���g���܂��B
%
%   ���� :
%   �֐� QUAD �́A�Ⴂ���x�ƃX���[�Y�łȂ���ϕ��֐��ɂ��A�������I��
%   �v�Z�ɂȂ�\��������܂��B
%   �֐� QUADV �́A�z��l FUN �ɑ΂��� QUAD (QUADL �łȂ�) ���x�N�g����
%   ���܂��B
%
%   �� :
%      Q = quadl(@myfun,0,2);
%   ������ myfun.m �́A���� M-�t�@�C���֐��ł��B
%      %-------------------%
%      function y = myfun(x)
%      y = 1./(x.^3-2*x-5);
%      %-------------------%
%
%   ���邢�́A�萔�̃p�����[�^���g�p���܂��B
%      Q = quadl(@(x)myfun2(x,5),0,2);
%   �����ŁAmyfun2 �́A���� M-�t�@�C���֐��ł��B
%      %----------------------%
%      function y = myfun2(x,c)
%      y = 1./(x.^3-2*x-c);
%      %----------------------%
%
%   ���� A, B �� FUN �̏o�͂̃N���X�T�|�[�g: 
%      float: double, single
%
%   �Q�l QUAD, QUADV, DBLQUAD, TRIPLEQUAD, TRAPZ, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc. 
