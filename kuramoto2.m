function K=kuramoto2(phi)
[n,m]=size(phi);
mean_phi=mean(mean(exp(complex(0,1)*phi)));
K=sum(abs(sum(exp(complex(0,1)*phi))-mean_phi))/(m*n);

end