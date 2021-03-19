function R=z_discos(otu)
%- coefficient of niche breadth
%USAGE: nB=nicheB(otu,method,e)
% otu       = input data (rows = objects, cols = variables)
% method    =  Levins(=1,default);Shannon-WInener(=2) or Smith(=3)
% e         = enviroment data
% nB        = result of niche breadth
% ---Notes:---
% This function is used to calculation of Coefficient of Niche Breadth Analysis.
%METHOD = 1, Use Levins method to calculation
%METHOD = 2, Use Shannon-Wienner method to calculation
%METHOD = 3, Use Smith method to calculation niche breadth with environment
%factors
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
        
