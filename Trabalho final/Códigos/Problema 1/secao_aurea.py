from math import *

def intervalo(f,x1,h):
 c = (1.0+sqrt(5.0))/2.0
 f1 = f(x1)
 x2 = x1 + h
 f2 = f(x2)

 if f2 > f1:
  h = -h
  x2 = x1 + h
  f2 = f(x2)
  if f2 > f1: return x2,x1 - h
 for i in range (100):
  h = c*h
  x3 = x2 + h
  f3 = f(x3)
  if f3 > f2: 
   return x1,x3
  x1 = x2
  x2 = x3
  f1 = f2
  f2 = f3
 print("Nao foi possivel encontrar um minimo")

def busca(f,a,b,tol=1.0e-9):
 nIter = int(ceil(-2.078087*log(tol/abs(b-a))))
 R = ((1.0+sqrt(5.0))/2.0)-1
 C = 1.0 - R

 x1 = R*a + C*b; x2 = C*a + R*b
 f1 = f(x1); f2 = f(x2)

 for i in range(nIter):
  if f1 > f2:
   a = x1
   x1 = x2
   f1 = f2
   x2 = C*a + R*b
   f2 = f(x2)
 else:
  b = x2
  x2 = x1
  f2 = f1
  x1 = R*a + C*b
  f1 = f(x1)
  if f1 < f2: 
   return x1,f1 
  else: 
   return x2,f2
