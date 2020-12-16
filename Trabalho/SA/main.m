
function principal

clc
clear all
clear global
close all

%==================================================================
%
%        PAR�METROS PARA EXECU��O
%
%==================================================================

nvars=2;                   %Quantidade de vari�veis de projeto
x=[0.8 0.8];           %Vetor dos par�metros de projeto
ntemps=500;                 %Quantidade de temperaturas
niters=5000;                  %Quantidade de itera��oes para cada temperatura
setback=10;                 %Volta a itera��o se necess�rio niters/2
maxcalls=10000;               %Numero limite de avalia��es da fun��o objetivo
fquit=1.e-5;              %Toler�ncia para a qual a fun��o ser� considerada minimizada
tdesvio=1.e-6;
starttemp=[.5 .5];   %Temperatura incial ( � o desvio padr�o da
                                 %perturba��o rand�mica usada inicialmente
                                 %deve ser maior que a m�xima dist�ncia 
                                 %esperada entre o in�cio e o ponto de m�nimo
                                 %� o desvio padr�o final. Ele deve ter a 
                                 %magnitude da precis�o esperada na localiza��o do
                                 %do melhor ponto
stoptemp=[.01 .01];                          

xlower=[-2 -2];         % limite inferior das vari�veis de projeto
xupper=[2 2];   % limite superior das vari�veis de projeto

[X,FO]=Simulate(nvars,x,ntemps,niters,setback,...
    maxcalls,fquit,tdesvio,starttemp,stoptemp,...
    xlower,xupper);