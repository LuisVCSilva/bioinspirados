#!/usr/bin/env python

from os import *

def main():
 seeds = [0,1,2,3,4,5,6,7,8,9]

 N = [5,50,100]        #tamanho de populacao
 NDefault = 50

 n_ger = [10,100,1000] #qtde de geracoes/iteracoes
 n_gerDefault = 500
 
 p_c = [0.5,0.7,0.9]   #probabilidade de crossover
 p_cDefault = 0.9

 p_m = [0.01,0.05,0.1] #probabilidade de mutacao
 p_mDefault = 0.1
 print(' '.join(["n_ger","seed","p_m","p_c","N"]))

 for seed in seeds:
   #print("Analise de N")
   for _n in N:
    system("./main.m " + (' '.join(map(str, {'seed':seed,'N':_n,'n_ger':n_gerDefault,'p_c':p_cDefault,'p_m':p_mDefault}.values()))))

   #print("\nAnalise de n_ger")
   for _n_ger in n_ger:
    system("./main.m " + (' '.join(map(str, {'seed':seed,'N':NDefault,'n_ger':_n_ger,'p_c':p_cDefault,'p_m':p_mDefault}.values()))))

   #print("\nAnalise de p_c")
   for _p_c in p_c:
    system("./main.m " + (' '.join(map(str, {'seed':seed,'N':NDefault,'n_ger':n_gerDefault,'p_c':_p_c,'p_m':p_mDefault}.values()))))

   #print("\nAnalise de p_m")
   for _p_m in p_m:
    system("./main.m " + (' '.join(map(str, {'seed':seed,'N':NDefault,'n_ger':n_gerDefault,'p_c':p_cDefault,'p_m':_p_m}.values()))  ))

if __name__ == "__main__":
 main()
[500, 9, 0.1, 0.9, 50]

