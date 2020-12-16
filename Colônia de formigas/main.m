%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%
function main
clc;
clear;
close all;

%% Problem Definition

CostFunction=@(x) Objective_Function(x);        % Cost Function
nVar=3;             % Number of Decision Variables
VarSize=[1 nVar];   % Variables Matrix Size
VarMin=[0 0 0];         % Decision Variables Lower Bound
VarMax=[1 1 1];         % Decision Variables Upper Bound

%% ACOR Parameters

MaxIt=1000;          % Maximum Number of Iterations
nPop=10;            % Population Size (Archive Size)
nSample=40;         % Sample Size
q=0.5;              % Intensification Factor (Selection Pressure)
zeta=1;             % Deviation-Distance Ratio

%% Initialization

% Create Empty Individual Structure
empty_individual.Position=[];
empty_individual.Cost=[];

% Create Population Matrix
pop=repmat(empty_individual,nPop,1);

% Initialize Population Members
for i=1:nPop
    
    % Create Random Solution
    pop(i).Position=unifrnd(VarMin,VarMax,VarSize);
    
    % Evaluation
    pop(i).Position=reparo(pop(i).Position,nVar,VarMin,VarMax);
    pop(i).Cost=CostFunction(pop(i).Position);
    
end

% Sort Population
[~, SortOrder]=sort([pop.Cost]);
pop=pop(SortOrder);

% Update Best Solution Ever Found
BestSol=pop(1);

% Array to Hold Best Cost Values
BestCost=zeros(MaxIt,1);

% Solution Weights
w=1/(sqrt(2*pi)*q*nPop)*exp(-0.5*(((1:nPop)-1)/(q*nPop)).^2);

% Selection Probabilities
p=w/sum(w);


%% ACOR Main Loop

for it=1:MaxIt
    
    % Means
    s=zeros(nPop,nVar);
    for l=1:nPop
        s(l,:)=pop(l).Position;
    end
    
    % Standard Deviations
    sigma=zeros(nPop,nVar);
    for l=1:nPop
        D=0;
        for r=1:nPop
            D=D+abs(s(l,:)-s(r,:));
        end
        sigma(l,:)=zeta*D/(nPop-1);
    end
    
    % Create New Population Array
    newpop=repmat(empty_individual,nSample,1);
    for t=1:nSample
        
        % Initialize Position Matrix
        newpop(t).Position=zeros(VarSize);
        
        % Solution Construction
        for i=1:nVar
            
            % Select Gaussian Kernel
            l=RouletteWheelSelection(p);
            
            % Generate Gaussian Random Variable
            newpop(t).Position(i)=s(l,i)+sigma(l,i)*randn;
            
        end
        
        % Evaluation
        newpop(t).Position=reparo(newpop(t).Position,nVar,VarMin,VarMax);
        newpop(t).Cost=CostFunction(newpop(t).Position);
        
    end
    
    % Merge Main Population (Archive) and New Population (Samples)
    pop=[pop
         newpop]; %#ok
     
    % Sort Population
    [~, SortOrder]=sort([pop.Cost]);
    pop=pop(SortOrder);
    
    % Delete Extra Members
    pop=pop(1:nPop);
    
    % Update Best Solution Ever Found
    BestSol=pop(1);
    
    % Store Best Cost
    BestCost(it)=BestSol.Cost;
    
    % Show Iteration Information
    disp([' Iteration: ' num2str(it) ', Objective Function: ' num2str(BestCost(it))]);
    for kvar=1:nVar
     fprintf(' x(%d)=%.20f\n',kvar,BestSol.Position(kvar));
    end
end

%% Results

x=BestSol.Position;
t=linspace(0,1,12);

for i=1:11
 if ((x(1)>=t(i)) & (x(1)<=t(i+1)))
  x(1)=i-1;
 end
end

for i=1:11
 if ((x(2)>=t(i)) & (x(2)<=t(i+1)))
  x(2)=i-1;
 end
end

for i=1:11
 if ((x(3)>=t(i)) & (x(3)<=t(i+1)))
  x(3)=i-1;
 end
end

x

% t1=linspace(0,1,12);
%  t2=linspace(0,10,11);
% 
%  x=BestSol.Position;
%  for i=1:length(x)
%   for j=1:length(t1)-1
%     if ((x(i)>=t1(j)) & (x(i)<=t1(j+1)))
%       xnew(i)=t2(j);  
%     end    
%   end
%  end 
%  
%  xnew
 
figure;
plot(BestCost,'LineWidth',2);
%semilogy(BestCost,'LineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;
