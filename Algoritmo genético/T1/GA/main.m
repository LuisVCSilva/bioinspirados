#!/usr/bin/env octave
1;

function [main] = main(argv)
n_ger = str2num(argv{1});
semente  = str2num(argv{2});
p_m   = str2num(argv{3});
p_c   = str2num(argv{4});
N     = str2num(argv{5});
printf("\nINÍCIO DA EXECUÇÃO\n");
printf("Algoritmo genético executando com os seguintes parâmetros:\n");
printf("Qtde máxima de gerações: %d\n",n_ger);
printf("Semente: %d\n",semente);
printf("Probabilidade de mutação: %f\n",p_m);
printf("Probabilidade de crossover: %f\n",p_c);
printf("Tamanho da População: %d\n",N);
%semente=seed;
rand('seed',semente);
gaDat.NVAR=2;          % Number of variables (dimension of search space)
lb=[0 0];        % Inferior limits [x1 x2 ... xnvar]
ub=[10 10];          % Superior limits [x1 x2 ... xnvar]
gaDat.FieldD=[lb; ub];
gaDat.Objfun='objfun'; % Objective function
gaDat.MAXGEN=n_ger;      % Number of generation, gaDat.NVAR*20+10 by default
gaDat.NIND=N;         % Size of the population, gaDat.NVAR*50 by default
gaDat.Pc=p_c;          % Crossover probability, 0.9 by default
gaDat.Pm=p_m;          % Mutation probability, 0.1 by default
gaDat.ObjfunPar=[];    % Additional parameters of the objective function have to be packed in 
                       % a structure, empty by default                      
% Execute GA
gaDat=ga(gaDat);

Sol=gaDat.xmin;
printf("\nFIM DA EXECUÇÃO\n");
endfunction

main(argv);
