function res=dtrndanl2(g)
lg=size(g,1);

window=47;
res=zeros(size(g,2),size(g,1));

for k=1:size(res,1)
id_g=g(:,k)';
d_g=zeros((size(g,1)-window),lg);
s=zeros((size(g,1)-window),lg);

for j=1:(size(g,1)-window)
    d_g(j,j:j+window)=detrend(id_g(1,j:j+window));
    s(j,j:j+window)=1;
end
% 
for i=1:size(d_g,2)
    a=d_g(:,i);
    ss=s(:,i);
    ass=dot(a,ss);
    res(k,i)=ass/sum(ss~=0);
end

end
for i=1:size(res,1)
   res(i,:)=res(i,:)-mean(res(i,:));
end

