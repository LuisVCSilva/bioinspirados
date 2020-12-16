
function bat_alg(fname,d,Lb,Ub,n,N_gen,A,r,alpha,strategy)

% This frequency range determines the scalings
% You should change these values if necessary
Qmin=0;         % Frequency minimum
Qmax=2;         % Frequency maximum

% Iteration parameters
N_iter=0;       % Total number of function evaluations
% Initializing arrays
Q=zeros(n,1);   % Frequency
v=zeros(n,d);   % Velocities
% Initialize the population/solutions
for i=1:n,
  Sol(i,:)=Lb+(Ub-Lb).*rand(1,d);
  Fitness(i)=feval(fname,Sol(i,:));
end
% Find the initial best solution
[fmin,I]=min(Fitness);
best=Sol(I,:);

% Start the iterations -- Bat Algorithm  %
icont=1;
neval=0;
for t=1:N_gen, 
% Loop over all bats/solutions
        for i=1:n,
          Q(i)=Qmin+(Qmax-Qmin)*rand;
          v(i,:)=v(i,:)+(Sol(i,:)-best)*Q(i);
          S(i,:)=Sol(i,:)+v(i,:);
          % Pulse rate
          
          if rand > r % o valor de r cresce!!!!
            if strategy==1  
             rho=-1+2*rand;
             S(i,:)=best+rho*A;
             else
             S(i,:)=best+0.001*randn(1,d);
           end
          end

     % Apply simple bounds/limits
     S(i,:)=simplebounds(S(i,:),Lb,Ub);
     % Evaluate new solutions
           Fnew=feval(fname,S(i,:));
     % Update if the solution improves, or not too loud
           if (Fnew<=Fitness(i)) && (rand<A) ,
                Sol(i,:)=S(i,:);
                Fitness(i)=Fnew;
                A=alpha*A;
                r=(1-exp(-0.09*t))*r;
           end

          % Update the current best solution
          if Fnew<=fmin,
                best=S(i,:);
                fmin=Fnew;
          end
        end
               
  fprintf(1,'  Iteration: %d,    Best Value: %.11f\n',icont,fmin);
  for kk=1:d
   fprintf(1,'           x(%d) = %.10f',kk,best(kk));
  end
  fprintf(1,'\n');    
  N_iter=N_iter+n;
  icont=icont+1;
  
end
% % Output/display
fprintf(1,'\n');    
fprintf('=========================================\n');    
disp(['Number of evaluations: ',num2str(N_iter+n+neval)]);
disp(['Best =',num2str(best)]);
disp(['fmin=',num2str(fmin)]);
fprintf('=========================================\n');    
% Application of simple limits/bounds
function s=simplebounds(s,Lb,Ub)
  % Apply the lower bound vector
  ns_tmp=s;
  I=ns_tmp<Lb;
  ns_tmp(I)=Lb(I);
  
  % Apply the upper bound vector 
  J=ns_tmp>Ub;
  ns_tmp(J)=Ub(J);
  % Update this new move 
  s=ns_tmp;

