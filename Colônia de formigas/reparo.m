
function Y=reparo(X,nVar,VarMin,VarMax);

 Y=X;
 for i=1:nVar
  if X(i)<VarMin(i)
    Y(i)=VarMin(i);  
  end  
  if X(i)>VarMax(i)
    Y(i)=VarMax(i);  
  end 
 end