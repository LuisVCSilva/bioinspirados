
function fo = eval_objective(x,Y);

w=Y(1);
d = 
% ZDT1
% f(1)=x(1);
% f(2)=(1+9/4*x(2)+9/4*x(3)+9/4*x(4)+9/4*x(5))*(1-(x(1)/(1+9/4*x(2)+9/4*x(3)+9/4*x(4)+9/4*x(5)))^(1/2));

% ZDT2
% f(1)=x(1);
% f(2)=(1+9/4*x(2)+9/4*x(3)+9/4*x(4)+9/4*x(5))*(1-x(1)^2/(1+9/4*x(2)+9/4*x(3)+9/4*x(4)+9/4*x(5))^2);

% ZDT3
f(1)=x(1);
f(2)= (1+9/4*x(2)+9/4*x(3)+9/4*x(4)+9/4*x(5))*(1-(x(1)/(1+9/4*x(2)+9/4*x(3)+9/4*x(4)+9/4*x(5)))^(1/2)-...
    x(1)/(1+9/4*x(2)+9/4*x(3)+9/4*x(4)+9/4*x(5))*sin(10*pi*x(1)));

fo=w*f(1)+(1-w)*f(2);g


faux = 9.8*d*t-2*d;

g(1) = p/(pi*d*t*sigmay)-1;
g(2) = (8*P*L^2)/(pi^3*E*d*t(d^2+t^2))

rp = 10^10
P = 2500;
sigmay = 500;
E = 0.85*10^6;
L = 250;

d = x(1);
t = x(2);
faux = 9.8*d*t+2*d;

g1 = P/(pi*d*t)
g2 = (8*P*L^2)
g3 = 2/d-1
g4 = d/14-1;
g5 = 0.2/t-1;
g6 = 2/0.8-1;