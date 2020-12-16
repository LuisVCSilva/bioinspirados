
% ======================================================== % 
% Files of the Matlab programs included in the book:       %
% Xin-She Yang, Nature-Inspired Metaheuristic Algorithms,  %
% Second Edition, Luniver Press, (2010).   www.luniver.com %
% ======================================================== %    

% -------------------------------------------------------- %
% Bat-inspired algorithm for continuous optimization (demo)%
% Programmed by Xin-She Yang @Cambridge University 2010    %
% -------------------------------------------------------- %
% Usage: bat_algorithm([20 1000 0.5 0.5]);                 %


% -------------------------------------------------------------------
% This is a simple demo version only implemented the basic          %
% idea of the bat algorithm without fine-tuning the parameters,     % 
% Then, though this demo works very well, it is expected that       %
% this demo is much less efficient than the work reported in        % 
% the following papers:                                             %
% (Citation details):                                               %
% 1) Yang X.-S., A new metaheuristic bat-inspired algorithm,        %
%    in: Nature Inspired Cooperative Strategies for Optimization    %
%    (NISCO 2010) (Eds. J. R. Gonzalez et al.), Studies in          %
%    Computational Intelligence, Springer, vol. 284, 65-74 (2010).  %
% 2) Yang X.-S., Nature-Inspired Metaheuristic Algorithms,          %
%    Second Edition, Luniver Presss, Frome, UK. (2010).             %
% 3) Yang X.-S. and Gandomi A. H., Bat algorithm: A novel           %
%    approach for global engineering optimization,                  %
%    Engineering Computations, Vol. 29, No. 5, pp. 464-483 (2012).  %
% -------------------------------------------------------------------
% Modified by Fran Sérgio Lobato

function main

clc
clear all
close all
format long

% Default parameters
D=2;      % Number of design variables
Lb=[0 0]; % Lower limit/bounds/ a vector
Ub=[0.0 10];% Upper limit/bounds/ a vector
n=50;       % Population size, typically 10 to 40
N_gen=2000;  % Number of generations
A=0.9;      % Loudness  (constant or decreasing)
r=0.1;   % Pulse rate (constant or decreasing)
alpha=0.01;   % reduction rate
strategy=2; % 1 - estratégia proposta no artigo do Yang
            % 2 - estratégia implementada no código
            
semente=9; % semente
%rand('seed',semente);
bat_algorithm('eval_objective',D,Lb,Ub,n,N_gen,A,r,alpha,strategy)

