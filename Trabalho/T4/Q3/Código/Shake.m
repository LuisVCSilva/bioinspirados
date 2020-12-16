function xreturn = Shake(nvars,center,x,temp,xlower,xupper)

%temp=(temp*sqrt(12)/(2));
ik=1;
while ik<= nvars
   %rand('seed',(100*clock))
   %rand('seed')
   a1=rand;
   %rand('seed',(100*clock))
   a2=rand;
   %rand('seed',(100*clock))
   a3=rand;
   %rand('seed',(100*clock))
   %rand('seed')
      a4=rand;
      r=(a1+a2-a3-a4);
    %  pause;
      xreturn(ik)=center(ik)+temp(ik)*r;
      if xreturn(ik) >= xlower(ik)
         if xreturn(ik) <= xupper(ik)
            ik=ik+1;
         end
      end    
end
