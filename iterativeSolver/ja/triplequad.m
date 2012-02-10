% TRIPLEQUAD    ���l�I�ȎO�d�ϕ��̌v�Z
%
%   Q = TRIPLEQUAD(FUN,XMIN,XMAX,YMIN,YMAX,ZMIN,ZMAX) �́A3 ���������`
%   �̈� XMIN <= X <= XMAX, YMIN <= Y <= YMAX, ZMIN <= Z <= ZMAX ��ŁA
%   FUN(X,Y,Z) �̎O�d�ϕ����v�Z���܂��BFUN �͊֐��n���h���ł��B
%   FUN(X,Y,Z) �́A�x�N�g�� X �ƃX�J�� Y, Z ���󂯓���A��ϕ��֐��̒l��
%   �x�N�g����Ԃ��K�v������܂��B
%
%   Q = TRIPLEQUAD(FUN,XMIN,XMAX,YMIN,YMAX,ZMIN,ZMAX,TOL) �́A�f�t�H���g�� 
%   1.e-6 �̑���ɋ��e�덷 TOL ���g�p���܂��B
%
%   Q = TRIPLEQUAD(FUN,XMIN,XMAX,YMIN,YMAX,ZMIN,ZMAX,TOL,@QUADL) �́A
%   �f�t�H���g�� QUAD �̑���ɋ��ϊ֐� QUADL ���g�p���܂��B
%   Q = TRIPLEQUAD(FUN,XMIN,XMAX,YMIN,YMAX,ZMIN,ZMAX,TOL,MYQUADF) �́A
%   QUAD �̑���Ƀ��[�U��`�̋��ϊ֐� MYQUADF ���g�p���܂��BMYQUADF �́A
%   QUAD ����� QUADL �Ɠ����Ăяo���V�[�P���X�����K�v������܂��B
%   TOL �̃f�t�H���g�l�𓾂�ɂ́A�v���[�X�z���_�[�Ƃ��� [] ���g�p����
%   ���������B
%
%   �� :
%   �̈� 0 <= x <= pi, 0 <= y <= 1, -1 <= z <= 1 �Őϕ����܂��B
%      Q = triplequad(@(x,y,z) (y*sin(x)+z*cos(x)), 0, pi, 0, 1, -1, 1)
%   �܂��́A
%      Q = triplequad(@integrnd, 0, pi, 0, 1, -1, 1)
%   �����ŁA��ϕ��֐��́A���� M-�t�@�C���֐��ł��B
%       %----------------------------%
%       function f = integrnd(x, y, z)
%       f = y*sin(x)+z*cos(x);  
%       %----------------------------%
%
%   ��ϕ��֐��́A�x�N�g�� x �ƃX�J�� y, z �Ŏ��s����邱�Ƃɒ��ӂ��Ă��������B
%
%   ���� XMIN,XMAX,YMIN,YMAX,ZMIN,ZMAX �� FUN �̏o�͂̃N���X�T�|�[�g :
%      float: double, single
%
%   �Q�l QUAD, QUADL, DBLQUAD, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc.
