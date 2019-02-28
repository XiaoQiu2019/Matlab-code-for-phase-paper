function Ktwocell=kuramoto_within_twocell_droplet(g)
%%two cell droplet data 
%detrend data
res=dtrndanl2(g);
%run hilbert phase code
for i=1:size(res,1)
[phi(i,:),phi_J2(i,:),phi_adj(i,:),im_analytic_signal_x(i,:),re_analytic_signal_x(i,:)]= hilbert_phase(res(i,:));
end
%obtain K for two cells within one droplet
m=size(phi,2);
for j=1:2:size(phi,1)
twocelld=phi(j:j+1,:);
n=size(twocelld,1);
mean_phi=mean(mean(exp(complex(0,1)*twocelld)));
G(j,:)=sum(abs(sum(exp(complex(0,1)*twocelld))-mean_phi))/(m*n);
end
Ktwocell=sum(G)/568;
end

