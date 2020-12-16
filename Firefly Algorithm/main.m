#!/usr/bin/env octave
1;

function [main] = main(argv)
D=2; % n�mero de vari�veis de projeto
XVmin=[-10 -10 -10 -10]; % limite inferior
XVmax=[10 10 10 10]; % limite superior

NP=50; % tamanho da popula��o  
MaxGeneration=250; % n�mero de gera��es
alpha=0.5; % par�metro de aleatoriedade
beta_o=0.2; % par�metro de atratividade  
y=[]; % vetor de constantes (problema em an�lise)
gamma=1;
%semente=0; % semente
%rand('seed',semente);

[x,fval,NumEval]=firefly_algorithm('eval_objective',D,NP,MaxGeneration,alpha,beta_o,XVmin,XVmax,y,gamma)
endfunction

main(argv);