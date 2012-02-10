function yp = f(t,y)

global outm w0 Bmat q f1 f2 sSf  sType teType stimLenght

%   yp = outm*y+w0*Bmat*q*(sinc((t-0.0002)/0.00008));
      stimLenght = 0.0;
   if (sType == 0)
       if(teType==1) stimLenght = 0.0002;
       elseif(teType==2) stimLenght = 0.0001;
       elseif(teType==3) stimLenght = 0.00008;
       elseif(teType==4) stimLenght = 0.00005;
       end
       yp = outm*y+w0*Bmat*q*sinc((t-0.0002)/stimLenght);   
   elseif (sType == 1) 
          yp= outm*y+w0*Bmat*q*sin(2*t*pi*sSf);      
   elseif (sType == 2 || sType == 3)
           yp = outm*y+w0*Bmat*q*(3*sin(2*pi*f1*t)+sin(2*pi*f2*t) );
   else        
   end 

