function nB = nicheB(otu,method,e)
%- coeficient of niche breadth
%USAGE: nB=nicheB(otu,method,e)
% otu       = input data (rows = objects, cols = variables)
% method    =  Levins(=1,default);Shannon-WInener(=2) or Smith(=3)
% e         = enviroment data
% nB        = result of niche breadth
% ---Notes:---
% This function is used to calculation of Coeficient of Niche Breadth Analysis.
%METHOD = 1, Use Levins method to calculation
%METHOD = 2, Use Shannon-Wienner method to calculation
%METHOD = 3, Use Smith method to calculation niche breadth with environment
%factors
% -----References:-----
% 
% -----Author:-----
% by Yuhan Zheng, Sep-2020

% -----Check input & set defaults:-----
if (nargin < 2), method =1; end % center X by default
if (nargin < 3), e=[];end
[a,~]=size(otu);
otu=otu./sum(otu);
if method==1
    parfor i=1:a
       B= sum(otu(i,:).*otu(i,:));
       nB(i)=1./B;
    end
end
if method==2
    parfor i=1:a
       B= sum(otu(i,:).*log(otu(i,:)));
       nB(i)=-B;
    end
end
if method==3
    parfor i=1:a
        B=sum(sqrt(otu(i)*e(i)));
        nB(i)=B;        
    
    end
end