
function principal

clc
clear all
close all
format long

VTR = 0.0000001;%1.e-20; % critério de parada utilizado quando conhecemos a solução analítica do problema (não é o seu caso ... não precisa alterar esse valor)
D =5; % número de variáveis de projeto (problema) 

%XVmin = [0 0 0 0 0];
%XVmax = [1 1 1 1 1];
%
XVmin = [0 0];
XVmax = [20 1];

NP = 25; % tamanho da população
itermax = 250;  % número máximo de gerações/iterações
F = 0.8; % taxa de perturbação
CR = 0.8;  % probabilidade de cruzamento
strategy=7; % estratégia - veja a minha tese para mais detalhes ...
refresh=10; % nível de impressão na tela - não precisa alterar esse valor ...

Peso=linspace(0,1,50);

for i=1:length(Peso)
i    
rand('seed',0);
y=Peso(i);%  vetor de parâmetros de entrada    
[x,FO,NF] = differential_evolution('eval_objective',VTR,D,XVmin,XVmax,y,NP,itermax,F,CR,strategy,refresh);
 f1=x(1);
 f2= (1+9/4*x(2)+9/4*x(3)+9/4*x(4)+9/4*x(5))*(1-(x(1)/(1+9/4*x(2)+9/4*x(3)+9/4*x(4)+9/4*x(5)))^(1/2)-...
    x(1)/(1+9/4*x(2)+9/4*x(3)+9/4*x(4)+9/4*x(5))*sin(10*pi*x(1)));

 saida(i,:)=[y x f1 f2];
end
% X é o projeto final obtido
% FO é o valor da função objetivo
% NF é o número de avaliações da função objetivo

load ZDT3.txt
CP=ZDT3;

figure(1)
hold on
plot(CP(:,1),CP(:,2),'b.');
plot(saida(:,7),saida(:,8),'ro');
hold off