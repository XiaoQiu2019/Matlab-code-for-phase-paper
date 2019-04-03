function K=kuramoto_between_twocell(g)
%calculate K between two cell droplets
%detrend data
res=dtrndanl2(g);
%run hilbert phase code
for i=1:size(res,1)
[phi(i,:),phi_J2(i,:),phi_adj(i,:),im_analytic_signal_x(i,:),re_analytic_signal_x(i,:)]= hilbert_phase(res(i,:));
end
%get average phi in eanch droplet
p=zeros(568,563);
for j=1:568
    s=mean([phi((2*j-1),:);phi((2*j),:)]);
    p(j,:)=s;
end
K=kuramoto2(p);
end
