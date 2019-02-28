function Kbetweentwocell=kuramoto_between_twocell(g)
%calculate K between two cell droplets
%detrend data
res=dtrndanl2(g);
%run hilbert phase code
for i=1:size(res,1)
[phi(i,:),phi_J2(i,:),phi_adj(i,:),im_analytic_signal_x(i,:),re_analytic_signal_x(i,:)]= hilbert_phase(res(i,:));
end

for j=1:2:size(phi,1)
twocellb=phi(j:j+1,:);
s=mean(twocellb);
[m, n] = size (s);
mean_phi=mean(mean(exp(complex(0,1)*s)));
F(j,:)=sum(abs(sum(exp(complex(0,1)*s))-mean_phi))/(m*n);
end
Kbetweentwocell=sum(F)/568;
end