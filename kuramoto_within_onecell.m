function singlecellk=kuramoto_within_onecell(g,p)
%normalize data with rhodamine b: p
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


%%%within droplets
% calculate K for one cell droplets
for j=1:size(phi,1)
m=size(phi,2);
mean_phi(j,:)=mean(mean(exp(complex(0,1)*phi(j,:))));
K(j,:)=sum(abs(sum(exp(complex(0,1)*phi(j,:)))-mean_phi(j,:)))/(m*1);
end
singlecellk=sum(K)/1644;
end
