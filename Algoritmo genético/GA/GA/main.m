#!/usr/bin/env octave
%% Basic GA parameters
function [main] = main(argv)
clc
close all
clear all
format long

semente=2;
%rand('seed',semente);
gaDat.NVAR=2;          % Number of variables (dimension of search space)
lb=[0 0];        % Inferior limits [x1 x2 ... xnvar]
ub=[100 100];          % Superior limits [x1 x2 ... xnvar]
gaDat.FieldD=[lb; ub];
gaDat.Objfun='objfun'; % Objective function
gaDat.MAXGEN=500;      % Number of generation, gaDat.NVAR*20+10 by default
gaDat.NIND=50;         % Size of the population, gaDat.NVAR*50 by default
gaDat.Pc=0.9;          % Crossover probability, 0.9 by default
gaDat.Pm=0.1;          % Mutation probability, 0.1 by default
gaDat.ObjfunPar=[];    % Additional parameters of the objective function have to be packed in 
                       % a structure, empty by default
                      
% Execute GA
gaDat=ga(gaDat);

Sol=gaDat.xmin;
endfunction

main(argv);