% DBLQUAD  2 �d�ϕ��𐔒l�I�Ɏ��s
%
%   Q = DBLQUAD(FUN,XMIN,XMAX,YMIN,YMAX) �́A�����`��� XMIN <= X <= XMAX, 
%   YMIN <= Y <= YMAX �ŁAFUN(X,Y) �� 2 �d�ϕ������s���܂��BFUN �͊֐�
%   �n���h���ł��B�֐� Z=FUN(X,Y) �́A�x�N�g�� X �ƃX�J�� Y ���󂯓���A
%   �ϕ��l�̃x�N�g�� Z ��Ԃ��܂��B
%
%   Q = DBLQUAD(FUN,XMIN,XMAX,YMIN,YMAX,TOL) �́A�f�t�H���g�̋��e�덷 
%   1.e-6 �̑���ɁATOL ���g�p���܂��B
%
%   Q = DBLQUAD(FUN,XMIN,XMAX,YMIN,YMAX,TOL,@QUADL) �́A�f�t�H���g�� 
%   QUAD �̑���ɁA���ϊ֐� QUADL ���g�p���܂��B
%   Q = DBLQUAD(FUN,XMIN,XMAX,YMIN,YMAX,TOL,MYQUADF) �́AQUAD �̑����
%   ���[�U���g�̋��ϊ֐� MYQUADF ���g�p���܂��BMYQUADF�͊֐��n���h���ł��B
%   MYQUADF �́AQUAD �� QUADL �Ɠ����V�[�P���X�̌Ăяo�������K�v������
%   �܂��BTOL �̃f�t�H���g�l�𓾂�ɂ́A�v���[�X�z���_�[�Ƃ��� [] ��
%   �g�p���Ă��������B
%
%   �� �F
%   pi <= x <= 2*pi, 0 <= y <= pi �̐�����ϕ�����ɂ́A
%      Q = dblquad(@(x,y)y*sin(x)+x*cos(y), pi, 2*pi, 0, pi) 
%   �ƋL�q���邩�A�܂��́A
%      Q = dblquad(@integrnd, pi, 2*pi, 0, pi)
%   �Ƃ��܂��B�����ŁAintegrnd.m �́A���̂悤��M-�t�@�C���ł��B       
%      %-------------------------% 
%      function z = integrnd(x, y)
%      z = y*sin(x)+x*cos(y);  
%      %-------------------------% 
%
%   integrand �́A�x�N�g�� x �ƃX�J�� y �Ŏ��s����邱�Ƃɒ��ӂ��Ă��������B
%
%   �����łȂ��̈�́Aintegrand �̗̈�̊O���� 0 ��ݒ肷�邱�Ƃň����܂��B
%   �����̑̐ς́A���̂悤�ɋ��܂�܂��B
%      V = dblquad(@(x,y) sqrt(max(1-(x.^2+y.^2),0)),-1,1,-1,1)
%   �܂���
%      V = dblquad(@(x,y) sqrt(1-(x.^2+y.^2)).*(x.^2+y.^2<=1),-1,1,-1,1)
%
%   ���� XMIN,XMAX,YMIN,YMAX �� FUN �̏o�͂̃N���X�T�|�[�g:
%      float: double, single
% 
%   �Q�l QUAD, QUADL, TRIPLEQUAD, TRAPZ, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc.
