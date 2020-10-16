function nO=nicheO(otu,method,e)
%- coefficient of niche overlap
%USAGE: nB=nicheO(otu,method,e)
% otu       = input data (rows = objects, cols = variables)
% method    = Levins(=1,default);Schoener(=2); Petraitis(=3); Pianka(=4)
% e         = envrionmental factors
% nO        = result of niche overlap
% ---Notes:---
% This function is used to calculation of Coefficient of Niche Overlap Analysis.
%METHOD = 1, Use Levins method to calculation
%METHOD = 2, Use Schoener method to calculation
%METHOD = 3, Use Petraitis method to calculation
%METHOD = 4, Use Pianka method to calculation
%factors
% -----References:-----
% Levins R. 1968. Evolution in Changing Environments: Some Theoretical Explorations
% -----Author:-----
% by Yuhan Zheng, Sep-2020

% -----Check input & set defaults:-----
if (nargin < 2), method =1; end % center X by default

[a,~]=size(otu);
otu=otu./sum(otu);
nO=zeros(a,a); 
switch method
    case 1  % Use Levins method
%        nO(a,a)=[];
        parfor i=1:a
             for j=1:a
                B1=sum(otu(i,:).*otu(i,:));
                B2=sum(otu(i,:).*otu(j,:));
                nO(i,j)=B2./B1;
             end
        end
       
    case 2 % Use Schoener method
        for i=1:a
            for j=1:a
                nO(i,j)=1-0.5*sum(abs(otu(i,:)-otu(j,:)));
            end
        end 
    case 3 %  Use Petraitis method
        for i=1:a
            for j=1:a
                nO(i,j)=exp(sum(otu(i,:).*log(otu(j,:)))-sum(otu(i,:).*log(otu(i,:))));
                
            end
        end
  case 4 % Use Pianka method
        for i=1:a
            for j=1:a
               O1=sum(otu(i,:).*otu(j,:));
               O2=sqrt(sum(otu(i,:).*otu(i,:)).*sum(otu(j,:).*otu(j,:)));
                nO(i,j)= O1./O2;
            end
        end
end
       
end
