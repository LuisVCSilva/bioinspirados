#!/usr/bin/env octave
1;

function [main] = main(argv)
D=2; % número de variáveis de projeto
XVmin=[-10 -10 -10 -10]; % limite inferior
XVmax=[10 10 10 10]; % limite superior

NP=50; % tamanho da população  
MaxGeneration=250; % número de gerações
alpha=0.5; % parâmetro de aleatoriedade
beta_o=0.2; % parâmetro de atratividade  
y=[]; % vetor de constantes (problema em análise)
gamma=1;
%semente=0; % semente
%rand('seed',semente);

[x,fval,NumEval]=firefly_algorithm('eval_objective',D,NP,MaxGeneration,alpha,beta_o,XVmin,XVmax,y,gamma)
endfunction

main(argv);