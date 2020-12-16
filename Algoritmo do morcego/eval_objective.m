
function f=eval_objective(x,y);

%A1=x(1);
%A2=x(2);
%l=100;
%P=2;
%sigma=2;
%faux=l*(2*sqrt(2)*A1+A2);

%g(1)=(sqrt(2)*A1+A2)/(sqrt(2)*A1^2+2*A1*A2)*P-sigma;
%g(2)=(A2)/(sqrt(2)*A1^2+2*A1*A2)*P-sigma;
%g(3)=(1)/(sqrt(2)*A1^2+2*A1*A2)*P-sigma;
%g(4)=x(1)-1;
%g(5)=-x(1);
%g(6)=x(2)-1;
%g(7)=-x(2);

%soma=0;
%for i=1:7
% soma=soma+(max(0,g(i)))^2;
%end
%rp=1E10;
%f=faux+rp*soma;

%if x(2)<=5
% x(2) = 0;
% else
% x(2) = 1;
% end


%g(1) = 1.25-x(1)^2-x(2)
%g(2) = x(1)+x(2) - 1.6
%rp = 10^10;

%f = 2*x(1)+x(2) + rp* ( (max(0,g(1)))^2 + (max(0,g(2)))^2);
f = (x(1)*sin(4*x(1))+1.1*x(2)*sin(2*x(2)));