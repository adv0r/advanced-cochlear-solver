function ef=nonlocal_alpha(xx)

%
% funzione per alpha non locale
%

global x uquad actual_x lambda ncb

u=interp1(x(1:ncb-1),uquad,xx);
tmp=7e+8*u; tmp2=xx-actual_x;
ef=(1-tmp.*tmp).*exp(-tmp2.*tmp2./lambda);

% end function