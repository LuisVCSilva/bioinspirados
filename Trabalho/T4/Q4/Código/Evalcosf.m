%[[[[[[[[[[[[[[    nome : evalcosf.m    ]]]]]]]]]]]]]]]]

% -------------------------------------------------------------------------
% -----                  AVALIA��O DA FUN��O OBJETIVO                 -----
% -----                                                               -----
% -------------------------------------------------------------------------


function costf=evalcosf(x)
p = [5.0 5.0];
k = [8.0 1.0];
l = [10.0 10.0];
costf = 0.5*k(1)*(sqrt(x(1)^2+(l(1)-x(2))^2)-l(1))^2 + 0.5*k(2)*(sqrt(x(1)^2+(l(2)+x(2))^2)-l(2))^2 - p(1)*x(1) - p(2)*x(2);
