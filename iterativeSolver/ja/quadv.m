% QUADV  �x�N�g�������ꂽ QUAD
%
%   Q = QUADV(FUN,A,B) �́A�ċA�I�ȓK�� Simpson ���ϖ@���g���� 1.e-6 ��
%   �덷�ȓ��ɂȂ�悤�ɕ��f���̔z��̒l�̊֐� FUN �� A ���� B �܂ŋߎ����܂��B
%   FUN �͊֐��n���h���ł��B �֐� Y=FUN(X) �́A�X�J���̈��� X ���󂯓���A
%   X �Ōv�Z���ꂽ��ϕ��֐��ł��錋�ʂ̔z�� Y ��Ԃ��܂��B
%
%   Q = QUADV(FUN,A,B,TOL) �́A�f�t�H���g�ł��� 1.e-6 �̑���ɐ�΋��e
%   �덷 TOL ���g�p���܂��B
%
%   Q = QUADV(FUN,A,B,TOL,TRACE) �́ATRACE �� 0 �łȂ��ꍇ�́A�ċA�Ăяo������
%   [fcnt a b-a Q(1)] �̒l�������܂��B TOL �̃f�t�H���g�̒l���g�����߂ɂ�
%   ����� [] ���g�p���Ă��������B
%
%   [Q,FCNT] = QUADV(...) �́A�֐��̌v�Z�񐔂��o�͂��܂��B
%
%   ����: �������e�덷�����ׂĂ̐����ɑ΂��Ďg�p����܂��B ���̂��߁A
%   �X�̐����ɂ��� QUADV �œ���ꂽ���ʂ� QUAD �œ���ꂽ���̂͒ʏ�
%   �����ł͂���܂���B
%
%   ��:
%   �p�����[�^�����ꂽ�z��̒l�̊֐� myarrayfun �ɑ΂��āA
%      %--------------------------%
%      function Y = myarrayfun(x,n)
%      Y = 1./((1:n)+x);
%      %--------------------------%
%   ���̃V���^�b�N�X�́Aa=0 ���� b=1 �܂ł��p�����[�^�l n=10 ���g����
%   �ϕ����܂��B
%      Qv = quadv(@(x)myarrayfun(x,10),0,1);
%   ���ʂ̔z�� Qv �́AQ(k) = log((k+1)./(k)) �Ő��肳���v�f�������܂��B
%   ���[�v���� QUAD ���g�p���Čv�Z�����ꍇ�� Qv �͂킸���ɈقȂ�܂��B
%      for k = 1:10
%         Qs(k) = quad(@(x)myscalarfun(x,k),0,1);
%      end
%   ������ myscalarfun �͂��̒ʂ�ł��B
%      %---------------------------%
%      function y = myscalarfun(x,k)
%      y = 1./(k+x);
%      %---------------------------%
%
%   ���� A, B �� FUN �̏o�͂ɑ΂���N���X�T�|�[�g�͂��̒ʂ�ł��B
%      float: double, single
%
%   �Q�l QUAD, DBLQUAD, TRIPLEQUAD, FUNCTION_HANDLE.


%   Copyright 1984-2005 The MathWorks, Inc. 
