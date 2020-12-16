
function [bestmem,bestval,nfeval] = pso(fname,D,XVmin,XVmax,y,NP,itermax,cbi,cbf,cgi,cgf,wi,wf);
                                         
VTR=1E-20;
nfeval=0;
X = zeros(NP,D); %initialize pop to gain speed
V = zeros(NP,D); %initialize pop to gain speed

for i=1:NP
 %X(i,:) = XVmin.*ones(1,D) + rand(1,D).*(XVmin);
 X(i,:) = reparo(X(i,:),D,XVmin,XVmax);%XVmin.*ones(1,D) + rand(1,D).*(XVmax - XVmin);
 V(i,:) = XVmin.*ones(1,D) + rand(1,D).*(XVmax - XVmin);
 Y(i) = feval(fname,X(i,:),y);
 nfeval=nfeval+1;
end
 
X;
V;
Y;

%Y = calcobjfunc(objfunc, X);
Ybest = Y       
Xbest = X;       
                     
[GYbest, gbest] = min(Ybest)
                                  
gbest = gbest(1);

iter=1;

average=1/NP*(sum(Y));
worst=max(Y);

while (iter <= itermax) % & (abs(GYbest-worst) > VTR))
        
 % Calculating PSO parameters
 w  = linrate(wf,wi,itermax,0,iter);
 cp = linrate(cbf,cbi,itermax,0,iter);
 cg = linrate(cgf,cgi,itermax,0,iter);

 % For later calculations only
 GXbest = repmat(Xbest(gbest, :),NP, 1);

 % Calculating speeds
 V = w*V + cp*rand(size(V)).*(Xbest-X) + cg*rand(size(V)).*(GXbest-X);
 %V = min(vmax, abs(V)).*sign(V);

 % Population is moving
 X = X + V;
 for j=1:NP
  X(j,:)=reparo(X(j,:),D,XVmin,XVmax);
  Y(j) = feval(fname,X(j,:),y);
  nfeval=nfeval+1;
 end

 % Calculating new individually best values
 mask = Y<Ybest;
 mask = repmat(mask',1,D);
 Xbest = mask.*X +(~mask).*Xbest;
 Ybest = min(Y,Ybest);
         
 % Calculating new globally best value
 Ybest;
 [GYbest, gbest] = min(Ybest);
 gbest = gbest(1);
  
 average=1/NP*(sum(Y));
 worst=max(Y);
 fprintf(1,' ===============================================================================================================\n');
 fprintf(1,'                                               Function Objective \n');
 fprintf(1,' ===============================================================================================================\n');
 fprintf(1,'  Iteration: %d,   Best Value: %f, Average: %f, Worst: %f, Stop: %f\n',iter,GYbest,average,worst,...
       abs(GYbest-worst));
  for n=1:D
    fprintf(1,'  x(%d) = %f',n,Xbest(gbest,n));
  end
 fprintf(1,'\n');
     
  %save best_process.txt ninteration -ASCII
  %save average_process.txt nint_average -ASCII
  %save worst_process.txt nint_worst -ASCII
 iter = iter + 1;

end

bestmem = Xbest(gbest,:);
bestval = GYbest;

function Candidato = reparo(X,D,XVmin,XVmax)
for i=1:D
 if X(i)<XVmin(i)
  X(i) = XVmin(i);
 end
 if X(i)>XVmax(i)
  X(i) = XVmax(i);
 end
end
Candidato=X;
 
 
 
 
 
 
 
 
 