%需要FTM工具箱
function Oi = z_disdecay(A,s)


 %% 距离计算
 d=[];
 z = width(A);
for i=1:z
tem=distance(s(i,:),s);
d=[d tem];
end
 %% 多样性距离计算
 dis=f_braycurtis(A); %B-C 距离
 dis=1-dis;    %通过1-BC距离获得相似度（什么垃圾算法
%   linearCoef = polyfit(d,dis,1);
%   linearFit = polyval(linearCoef,d);
% plot(d,dis,'s',d,linearFit,'r-');
% d(find(dis==1))=[];
% dis(find(dis==1))=[];
% mdl = fitglm(d,dis) 
% md2 = fitglm(log(d),log(smx))
%%dis=f_dis(N1','bc');% ave cor
d(find(dis==0))=[];
dis(find(dis==0))=[];

x=d';
y=dis';
% x=log(x);y=log(y);
%[curvefit,gof,output] = fit(x,y,'poly1','normalize','on');
% 
%  plot(curvefit,x,y,'predfunc');ylim([0,1])
%  hold on
%  text(x(1),y(1),string({'p=';curvefit.p1}));
%% 新拟合 
 linemodel=fitlm(x,y);
 p=plot(linemodel);
p(1).Marker='.';
ylim([0,1]);
hold on
pv=linemodel.Coefficients.pValue;
text(0.2,0.2,string({'p=';pv(2);'Rsquared=';linemodel.Rsquared.Adjusted}));
xlabel('Distance(km)');
ylabel('Bray-Curtis Similarity');
