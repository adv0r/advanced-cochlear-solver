% QUAD8  �����̐��l�ϕ�
%
%   QUAD8 �́A�Â��֐��ł��B����� QUADL �g�p���Ă��������B
%
%   Q = QUAD8(FUN,A,B) �́A�K�����J�[�V�u�� Newton Cotes 8 panel �@��
%   �g���āA1e-3 �̑��Ό덷�ȓ��ŁAA ���� B �܂ł̃X�J���l�̊֐� FUN ��
%   �ϕ����ߎ����܂��BFUN �͊֐��n���h���ł��B�֐� Y=FUN(X) �́A�x�N�g����
%   ���� X ���󂯓���AX �̊e�v�f�ŕ]�����ꂽ�֐� FUN �ƂȂ�x�N�g�� Y ��
%   �Ԃ��܂��B
%   ���ٓ_�̐ϕ����������J�[�V�������x���ɒB����ƁAQ = Inf ���o�͂���܂��B
%
%   Q = QUAD8(FUN,A,B,TOL) �́A���Ό덷�� TOL �ɂȂ�悤�ɐϕ����܂��B
%   2 �v�f�̋��e�덷 TOL = [rel_tol abs_tol] ���g���āA���Ό덷�Ɛ�Ό덷
%   ���w�肵�܂��B
%
%   Q = QUAD8(FUN,A,B,TOL,TRACE) �́A���Ό덷�� TOL �ɂȂ�܂Őϕ����܂��B
%   0 �łȂ� TRACE �ɑ΂��āA�ϕ��_�̃v���b�g���s���֐��̎��s��\�����܂��B
%   TOL �̃f�t�H���g�l�𓾂�ɂ̓v���[�X�z���_�[�Ƃ��� [] ���g�p���Ă��������B
%
%   �Q�l  QUADL, QUAD, QUADV, DBLQUAD, TRIPLEQUAD, TRAPZ, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc.
