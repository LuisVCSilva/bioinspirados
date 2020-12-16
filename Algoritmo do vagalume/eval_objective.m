
function result = eval_objective(x,y);

% A1=x(1);
% A2=x(2);
% P=2;
% l=100;
% sigma=2;
% 
% g(1)=(sqrt(2)*A1+A2)/(sqrt(2)*A1^2+2*A1*A2)*P-sigma;
% g(2)=(A2)/(sqrt(2)*A1^2+2*A1*A2)*P-sigma;
% g(3)=(1)/(A1+sqrt(2)*A2)*P-sigma;
% g(4)=-A1;
% g(5)=A1-1;
% g(6)=-A2;
% g(7)=A2-1;
% 
% res=0;
% for i=1:7
%  res=res+(max(0,g(i)))^2;   
% end
% rp=1E10;    
%     
% result=(2*sqrt(2)*A1+A2)*l+rp*res;
% 
banana=y(1);
f1=x(1)^2;
f2=(x(1)-2)^2;
result=banana*f1+(1-banana)*f2;

