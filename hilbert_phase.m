function[phi,phi_J2,phi_adj,im_analytic_signal_x,re_analytic_signal_x]= hilbert_phase(x)
[analytic_signal_x,hT]=hilbertS(x);
im_analytic_signal_x=imag(analytic_signal_x);
re_analytic_signal_x=real(analytic_signal_x);




phi_J1=atan2(im_analytic_signal_x,re_analytic_signal_x);
phi_J2=phi_J1+2*pi*(phi_J1<0.0);
TwoPiInt=2*pi*(-1:1);
Mtime=length(phi_J2)-1;
phi_adj=zeros(1,(Mtime+1));

for mtime=1:Mtime
   [dphiMin, mphi]=min(   abs(phi_J2(mtime+1)-phi_J2(mtime)+TwoPiInt)  );
  
    mphi=mphi-2;
   
   
    phi_adj(mtime+1)=phi_adj(mtime)+2*mphi*pi;
end

  phi=phi_J2+phi_adj;
  
  
 
end