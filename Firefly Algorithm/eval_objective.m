
function f=eval_objective(x,par);

%fo=(x(1)-1)^2+(x(2)-1)^2;
fo = x(1)^2-5*x(1)+x(2)^2-5*x(2)+2*x(3)^2-21*x(3)+x(4)^2+7*x(4)+50;
g(1) = x(1)^2-x(1)+2*x(2)^2+x(3)^2+x(3)+x(4)^2-x(4)-8;
g(2) = x(1)^2+x(1)+x(2)^2-x(2)+x(3)^2+x(3)+x(4)^2-x(4)-8;
g(3) = 2*x(1)^2+2*x(1)+x(2)^2-x(2)+x(3)^2-x(4)-5;
rp = 100000000000000;
f = fo + rp*(max(0,g(1)))^2 + rp*(max(0,g(2)))^2 + rp*(max(0,g(3)))^2;