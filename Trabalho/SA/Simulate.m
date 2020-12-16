%[[[[[[[[[[[[[[    nome : simulate.m    ]]]]]]]]]]]]]]]]

% disp('                                                                ')
% disp('================================================================')
% disp('================================================================')
% disp('                                                                ')
% disp('                                                                ')
% disp('              SIMULATED  ANNEALING              ')
% disp('                                                                ')
% disp('                                                                ')
% disp('================================================================')
% disp('================================================================')
function [X,FO]=Simulate(nvars,x,ntemps,niters,setback,...
    maxcalls,fquit,tdesvio,starttemp,stoptemp,...
    xlower,xupper)

%costf=evalcosf(xvar) 

%===========================================================================
%disp('ESTOU NO PROGRAMA SIMULATED ANNEALING')
tic

%==================================================================
%
%        INICIALIZAÇÃO DO VETOR CENT E DO MELHOR VALOR DA 
%                         FUNÇÃO OBJETIVO  
%
%==================================================================
cent=x;
xbest=x;
bestfval=Evalcosf(x);
bestx(1,:)=xbest(1,:);
bestfunction(1)=bestfval;
aceitx(1,:)=xbest(1,:);
aceitfunction(1)=bestfval;
ibest=1;
iaceit=1;
ncalls=1;
%==================================================================
%
%       INÍCIO DO LOOP PARA AS NTEMPS TEMPERATURAS
%
%==================================================================
                                    temp=starttemp;
for ii=1:1:nvars
   tempmult(ii,1)=exp(log(stoptemp(ii)/starttemp(ii))/(ntemps-1));
end 
%tempmult
%pause
for itemp=1:1:ntemps;                     %Loop de redução da temperatura
%    disp('Estou na iteracao de temperatura numero');
   %disp(itemp)
    flag1=0;                              %Flag se nesta temperatura houve 
                                          %melhora
%===================================================================
%
%     CÁLCULO DA SENSIBILIDADE DO OBJETIVO A CADA ITERAÇÃO ITEMP
%
%===================================================================
xres=xbest;
    for isen=1:1:nvars 
        xres(isen)=xres(isen)*.001+xres(isen);
        fval1=Evalcosf(xres);
        grad=(fval1-bestfval)/(xres(isen)-xbest(isen));
        sen(isen,itemp)=grad*(bestfval/xbest(isen));
        xres(isen)=xbest(isen);
    end
     
    for jj=1:1:niters     %Loop para cada temperatura !!!!!!!!!!!!!!!!!
    jj=1;
    while jj <= niters
       %disp('Estou na iteracao - >')
       xreturn=Shake(nvars,cent,x,temp,xlower,xupper);
       ncalls=ncalls+1;
        x=xreturn;
        fval=Evalcosf(x);
        if fval <= bestfval
           jj=jj-setback;                %Teste para aumentar o número de buscas
           if jj < 0                     %caso haja melhora na função objetivo
              jj=0;                      %na iteração jj da temperatura itemp.
           end   
           bestfval=fval;
           xbest=x;
           flag1=1;
           ibest=ibest+1;
           bestx(ibest,:)=xbest(1,:);
           bestfunction(ibest)=bestfval;
           cent=x;
        elseif fval > bestfval
           pfval=exp((-(fval-bestfval))/tdesvio);
           prand=rand;
 %             bestfval=fval;
 %             xbest=x;
              if prand < pfval                 %Aceite a configuração
                 iaceit=iaceit+1;
                 aceitx(iaceit,:)=x(1,:);
                 aceitfunction(iaceit)=fval;
                 centr=cent;
                 cent=x;
              end
         end
        if bestfval <= fquit        %Atendida a tolerância
           break
        end
        if ncalls >= maxcalls
           break
        end  
        jj=jj+1;
                     %=================================================
     end             %============Fim do Loop para a temperatura itemp
     if flag1==1     %==================================================
        cent=xbest;
     elseif flag1==0
        cent=x;
      end
      if bestfval<=fquit
         break
      end
       if ncalls >= maxcalls
          break
       end  
   temp=tempmult'.*temp;
end
end 

nmelhoras=size(bestx);
nmelhora=nmelhoras(1,1);
disp ('========= Ponto de Mínimo ==========')
disp(['Variaveis de projeto   ',num2str(xbest)])
disp(['Funcao Custo=     ',num2str(bestfval)])
disp(['Número de pontos visitados=  ',num2str(ncalls)])

X=xbest;
FO=bestfval;
TOC=toc;
% for isen=1:1:nvars
% %   [senmax,i]=max(sen(isen,:))
% %   sen(isen,:)=sen(isen,:)./senmax;
%     figure(isen)
%     plot(sen(isen,:))
% end
 
% end
 
%=========================================================================== 

	   
	   
	   

