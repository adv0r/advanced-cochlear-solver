function [x, iflag, ultimo_res, total_iters] = gmrespsx(aJ, x0, b, max_it, tol, precond)
% GMRES linear equation solver
% Implementation following Saad-Schultz
% preconditioned by D. Bertaccini
%
% C. T. Kelley, July 10, 1994
% Input: x0 = initial iterate
%        b = right hand side
%        PRECOND = precondizionamento. Attivo se >0.
%        atv, a matrix-vector product routine
%            atv must return Ax when x is input
%            the format for atv is
%            function ax = atv(x)
%            Note that for GMRES we incorporate any 
%            preconditioning into the atv routine.
%        params = three dimensional vector to control iteration
%            params(1) = relative residual reduction factor
%            params(2) = max number of iterations
%            params(3) (Optional) = reorthogonalization method
%                   1 -- Brown/Hindmarsh condition (default)
%                   2 -- Never reorthogonalize (not recommended)
%                   3 -- Always reorthogonalize (not cheap!)
% Requires givapp.m
iflag=0;
params(1)=tol;
params(2)=max_it;

%
% initialization
%
n=length(b);
errtol=params(1);
kmax=params(2);
reorth=1;
if length(params) == 3
    reorth=params(3);
end
x=x0;
%
%
h=zeros(kmax);
v=zeros(n,kmax);
c=zeros(kmax+1,1);
s=zeros(kmax+1,1);
if norm(x)>0
   r = b-aJ*x;
else
   r = b;
end



if precond>0
  r=dbprecb(r); % PRECOND. A SX
end %if

rho=norm(r);

ultimo_res=rho;

g=rho*eye(kmax+1,1);

bnorm=norm(b);
if bnorm<1e-5
    bnorm=1;
end

errtol=errtol*bnorm;
%error=[];
%
% test for termination on entry
%
%error=[error,rho];
total_iters=0;
if(rho < errtol) 
    return
end
%
v(:,1)=r/rho;
bbeta=rho;
k=0;
%
% GMRES iteration
%
while((rho > errtol) & (k < kmax))
    k=k+1;
    vv=v(:,k);
    vv1=massIT(vv);
    %v(:,k+1)=A*v(:,k);
    v(:,k+1)=vv1-aJ*vv;
    if precond>0
      v(:,k+1)=dbprec(v(:,k+1)); % LEFT PRECONDITIONING
    end %if
    normav=norm(v(:,k+1));
%
% Modified Gram-Schmidt
%
    for j=1:k
        h(j,k)=v(:,j)'*v(:,k+1);
        v(:,k+1)=v(:,k+1)-h(j,k)*v(:,j);
    end
    h(k+1,k)=norm(v(:,k+1));
    normav2=h(k+1,k);
 
%
% Reorthogonalize?
%
if  (reorth == 1 & normav + .001*normav2 == normav) | reorth ==  3
    for j=1:k
        hr=v(:,j)'*v(:,k+1);
        h(j,k)=h(j,k)+hr;
        v(:,k+1)=v(:,k+1)-hr*v(:,j);
    end
    h(k+1,k)=norm(v(:,k+1));
end
%
%   watch out for happy breakdown 
%
    if(h(k+1,k) ~= 0)
         v(:,k+1)=v(:,k+1)/h(k+1,k);
    end
%
%   Form and store the information for the new Givens rotation
%
    if k > 1
        h(1:k,k)=givapp(c(1:k-1),s(1:k-1),h(1:k,k),k-1);
    end
    nu=norm(h(k:k+1,k));
    if nu~=0
%        c(k)=h(k,k)/nu;
        c(k)=conj(h(k,k)/nu);
        s(k)=-h(k+1,k)/nu;
        h(k,k)=c(k)*h(k,k)-s(k)*h(k+1,k);
        h(k+1,k)=0;
        g(k:k+1)=givapp(c(k),s(k),g(k:k+1),1);
    end
%
% Update the residual norm
%
    rho=abs(g(k+1));
    %error=[error,rho];
    ultimo_res=rho;
    %fprintf('\nIter.->%i (%e)',k,ultimo_res);
end
%
% At this point either k > kmax or rho < errtol.
% It's time to compute x and leave.
%

total_iters=k;
y=h(1:k,1:k)\g(1:k);
x = x + v(1:n,1:k)*y;

%fprintf('\nGmres iter.->%i (%e)',k,ultimo_res);

% end gmrespsx.m