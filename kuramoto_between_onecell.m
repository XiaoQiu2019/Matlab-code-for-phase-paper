function K=kuramoto_between_onecell(g,p)
%%%Between droplets
%calculate K for for one cell between droplets
%normalize data with rhodamine b:p
for i=1:size(g,2)
g(:,i)=g(:,i)./p';
end
%detrend the data
res=dtrndanl2(g);
%run hilbert phase code 
for i=1:size(res,1)
[phi(i,:),phi_J2(i,:),phi_adj(i,:),im_analytic_signal_x(i,:),re_analytic_signal_x(i,:)]= hilbert_phase(res(i,:));
end
phi_J1=atan2(im_analytic_signal_x,re_analytic_signal_x);
%run kuramoto code
K=kuramoto2(phi);
end