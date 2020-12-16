
function main

clc
clear all
clear global
close all
format long
%
D = 1; % number of design variables
%
XVmin = [-10]; % bounds (inferior)
XVmax = [10];    % bounds (superior)
% 
itermax = 250;  % number of generations
%
NP = 50;        % population size
cbi = 2.5;      % Initial value of the individual-best acceleration factor.
cbf = 0.5;      % Final value of the individual-best acceleration factor.
cgi = 0.5;      % Initial value of the global-best acceleration factor.
cgf = 2.5;      % Final value of the global-best acceleration factor.
wi = 0.9;       % Initial value of the inertia factor.
wf = 0.4;       % Final value of the inertia factor.

theta_aux=linspace(0,1,20);

for i=1:length(theta_aux)
y=theta_aux(i);    
[X,FO,NF]=particle_swarm_optimization('eval_objective',D,XVmin,XVmax,y,NP,itermax,cbi,cbf,cgi,cgf,wi,wf);
%f1=X(1)^2;
%f2=(X(1)-2)^2;
%saida(i,:)=[theta_aux(i) f1 f2];
saida(i,:) = [X FO];
end

figure(1)
plot(saida(:,2),saida(:,3),'bo')
xlabel('f_1')
ylabel('f_2')



