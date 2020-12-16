function R=z_discos(otu)
[a,b]=size(otu);
for j=1:b
    parfor k=1:b
        xij=sum(otu(:,j));
        xik=sum(otu(:,k));
        xij2=sum(otu(:,j).^2);
        xik2=sum(otu(:,k).^2);
        
        temp_r=(xij-xik)./sqrt(xij2.*xik2);
        R(j,k)=temp_r;
     end
end
        