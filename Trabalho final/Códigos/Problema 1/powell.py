import numpy as np
from secao_aurea import *
import math

def powell(F,x,h=0.1,tol=1.0e-8):
 def f(s): #direcao de busca
  return F(x + s*v) 
 
 n = len(x)       
 df = np.zeros(n) 
 u = np. identity(n)      
 for j in range(100):
    x_anterior = x.copy()
    f_anterior = F(x_anterior)
    for i in range(n):
       v = u[i]
       a,b = intervalo(f,0.0,h)
       s,fMin = busca(f,a,b)
       df[i] = f_anterior - fMin
       f_anterior = fMin
       x = x + s*v
    v = x - x_anterior
    a,b = intervalo(f,0.0,h)
    s,f_ultimo = busca(f,a,b)
    x = x + s*v
    print(F(x))
    if math.sqrt(np.dot(x-x_anterior,x-x_anterior)/n) < tol: 
       return x,j+1
    iMax = np.argmax(df)
    for i in range(iMax,n-1):
       u[i] = u[i+1]
    u[n-1] = v
 print("Powell nao convergiu")
