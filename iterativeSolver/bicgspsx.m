function [x, flag, res, iter] = bicgspsx(t,y,aJ, x, b, max_it, tol,precond)

%
% bicgspsx: special bicgstab for distortion product iterative ode15s_dp
% (c) D. Bertaccini, 2009

% D. Bertaccini, 
% Universita' di Roma "Tor Vergata", Roma, Italy
% http://www.mat.uniroma2.it/bertaccini/
% bertaccini@mat.uniroma2.it

%         flag     INTEGER: 0 = solution found to tolerance
%                           1 = no convergence given max_it
%                          -1 = breakdown: rho = 0
%                          -2 = breakdown: omega = 0
%         precond>0 : A will be left preconditioned

%residuo_vero=0;
  iter = 0;                                          % initialization
  flag = 0;
  m_v=0; % numero prodotti matrice-vettore

  %r = b - A*x;
  
  r=b; % valido purche' x0=0

  res = norm( r ); 
  
  bnrm2 = norm( r );
  if  ( bnrm2 <1e-7 ), bnrm2 = 1.0; end  
  
  tol=tol*bnrm2;
   
  if ( res < tol ) return, end

  if (precond>0)
    r=dbprecb(r);
  end %if
  omega  = 1.0;
  r_tld = r;

  for iter = 1:max_it,                              % begin iteration

     rho   = ( r_tld'*r );                          % direction vector   
     if ( rho == 0.0 ) 
       disp('Breakdown: r_tld*r==0 - pause')
       r_tld, r
       pause
       break, 
     end

     if ( iter > 1 ),
        beta  = ( rho/rho_1 )*( alfa/omega );
        pp = r + beta*( pp- omega*v );
     else
        pp = r;
     end
 
     % v=A*pp;
     v1=massIT(t,y,pp);
     v = v1-aJ*pp;  
         
     m_v=m_v+1;  
          
     if (precond>0)
       v = dbprec(v);      % sistema circolante
     end %if

     alfa = rho / ( r_tld'*v );
     ss = r - alfa*v;
     %if (residuo_vero)
     %  error=norm(b-A*x);
     %else
       res = norm( ss );                     
     %end %if
     
     if ( res <= tol ),             % early convergence check
        x = x + alfa*pp;
        fprintf('\n*Iter.->%i (%e) (early)',iter,res)
        %res_iter(iter)=res;
        break;
     end

     %t = A*ss;   
     v1=massIT(t,y,ss);
     t = v1-aJ*ss;          
     
     m_v=m_v+1;
     
     if (precond>0)
       t = dbprec(t);                    % secondo sistema circolante
     end %if

     omega = ( t'*ss) / ( t'*t );
     x = x + alfa*pp + omega*ss;         % update approximation

     r = ss - omega*t;
     %if (residuo_vero)
     %  error=norm(b-A*x);
     %else
       res = norm( r );                     % check convergence
     %end %if
 
     
     %res_iter(iter)=res
     fprintf('\n*Iter.->%i (%e)',iter,res)
     if ( res <= tol ) 
       break 
     end

     if ( omega == 0.0 ), break, end
     rho_1 = rho;

  end
 
  if ( res <= tol | ss <= tol ),                   % converged
     flag =  0;
  elseif ( omega == 0.0 ),                          % breakdown
     flag = -2;
  elseif ( rho == 0.0 ),
     flag = -1;
  else                                              % no convergence
     flag = 1;
  end

%error=norm(b-A*x)

% END bicgspsx.m
