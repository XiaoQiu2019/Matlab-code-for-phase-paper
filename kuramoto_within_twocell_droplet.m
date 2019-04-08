function [G2,K2]=kuramoto_within_twocell_droplet(g)
%%two cell droplet data 
%detrend data
res=dtrndanl2(g);
%run hilbert phase code
for i=1:size(res,1)
    [phi(i,:),phi_J2(i,:),phi_adj(i,:),im_analytic_signal_x(i,:),re_analytic_signal_x(i,:)]= hilbert_phase(res(i,:));
end
%obtain K for two cells within one droplet
G2=zeros(568,1);
for j=1:568
    twocell=[phi((2*j-1),:);phi(2*j,:)];
    k=kuramoto2(twocell);
    G2(j,1)=k;
end
K2=sum(G2)/568;
end

