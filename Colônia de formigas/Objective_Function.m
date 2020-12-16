function f = obj(x)
 
%  t1=linspace(0,1,12);
%  t2=linspace(0,10,11);
% 
%  for i=1:length(x)
%   for j=1:length(t1)-1
%     if ((x(i)>=t1(j)) & (x(i)<=t1(j+1)))
%       xnew(i)=t2(j);  
%     end    
%   end
%  end
% 
%  rp=1E20;
%  g(1)=2*xnew(1)^2+xnew(2)-15; % <0
%  g(2)=-xnew(1)+2*xnew(2)+xnew(3)-3; %<0
%  
%  faux = xnew(1)^2+xnew(1)*xnew(2)+2*xnew(2)^2-...
%      6*xnew(1)-2*xnew(2)-12*xnew(3);
%  f=faux+rp*(max(0,g(1)))^2+rp*(max(0,g(2)))^2;

t=linspace(0,1,12);

for i=1:11
 if ((x(1)>=t(i)) & (x(1)<=t(i+1)))
  x(1)=i-1;
 end
end

for i=1:11
 if ((x(2)>=t(i)) & (x(2)<=t(i+1)))
  x(2)=i-1;
 end
end

for i=1:11
 if ((x(3)>=t(i)) & (x(3)<=t(i+1)))
  x(3)=i-1;
 end
end

g(1)=2*x(1)^2+x(2)-15;
g(2)=-x(1)+2*x(2)+x(3)-3;
faux=x(1)^2+x(1)*x(2)+2*x(2)^2-6*x(1)-2*x(2)-12*x(3);

soma=0;
rp=10^10;
for i=1:2
 soma=soma+rp*(max(0,g(i)))^2;
end
f=faux+soma;

end