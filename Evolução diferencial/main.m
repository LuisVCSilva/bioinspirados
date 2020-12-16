
function principal

clc
clear all
close all
format long

VTR = 0.0000001;%1.e-20; % crit�rio de parada utilizado quando conhecemos a solu��o anal�tica do problema (n�o � o seu caso ... n�o precisa alterar esse valor)
D =5; % n�mero de vari�veis de projeto (problema) 

%XVmin = [0 0 0 0 0];
%XVmax = [1 1 1 1 1];
%
XVmin = [0 0];
XVmax = [20 1];

NP = 25; % tamanho da popula��o
itermax = 250;  % n�mero m�ximo de gera��es/itera��es
F = 0.8; % taxa de perturba��o
CR = 0.8;  % probabilidade de cruzamento
strategy=7; % estrat�gia - veja a minha tese para mais detalhes ...
refresh=10; % n�vel de impress�o na tela - n�o precisa alterar esse valor ...

Peso=linspace(0,1,50);

for i=1:length(Peso)
i    
rand('seed',0);
y=Peso(i);%  vetor de par�metros de entrada    
[x,FO,NF] = differential_evolution('eval_objective',VTR,D,XVmin,XVmax,y,NP,itermax,F,CR,strategy,refresh);
 f1=x(1);
 f2= (1+9/4*x(2)+9/4*x(3)+9/4*x(4)+9/4*x(5))*(1-(x(1)/(1+9/4*x(2)+9/4*x(3)+9/4*x(4)+9/4*x(5)))^(1/2)-...
    x(1)/(1+9/4*x(2)+9/4*x(3)+9/4*x(4)+9/4*x(5))*sin(10*pi*x(1)));

 saida(i,:)=[y x f1 f2];
end
% X � o projeto final obtido
% FO � o valor da fun��o objetivo
% NF � o n�mero de avalia��es da fun��o objetivo

load ZDT3.txt
CP=ZDT3;

figure(1)
hold on
plot(CP(:,1),CP(:,2),'b.');
plot(saida(:,7),saida(:,8),'ro');
hold off