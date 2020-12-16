
function principal

clc
clear all
clear global
close all

%==================================================================
%
%        PARÂMETROS PARA EXECUÇÃO
%
%==================================================================

nvars=2;                   %Quantidade de variáveis de projeto
x=[0.8 0.8];           %Vetor dos parâmetros de projeto
ntemps=500;                 %Quantidade de temperaturas
niters=5000;                  %Quantidade de iteraçãoes para cada temperatura
setback=10;                 %Volta a iteração se necessário niters/2
maxcalls=10000;               %Numero limite de avaliações da função objetivo
fquit=1.e-5;              %Tolerância para a qual a função será considerada minimizada
tdesvio=1.e-6;
starttemp=[.5 .5];   %Temperatura incial ( é o desvio padrão da
                                 %perturbação randômica usada inicialmente
                                 %deve ser maior que a máxima distância 
                                 %esperada entre o início e o ponto de mínimo
                                 %É o desvio padrão final. Ele deve ter a 
                                 %magnitude da precisão esperada na localização do
                                 %do melhor ponto
stoptemp=[.01 .01];                          

xlower=[-2 -2];         % limite inferior das variáveis de projeto
xupper=[2 2];   % limite superior das variáveis de projeto

[X,FO]=Simulate(nvars,x,ntemps,niters,setback,...
    maxcalls,fquit,tdesvio,starttemp,stoptemp,...
    xlower,xupper);