from scipy.optimize import minimize,differential_evolution as de_min
from pyswarm import pso as pso_min

from problema import *

def save(x):
 print(F(x,rp))

a = 1.0
print("{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}".format("Rp","Powell - x","Powell - f(x)","Powell - g(x)","DE - x","DE - f(x)","DE - g(x)","PSO - x","PSO - f(x)","PSO - g(x)"))
F = MPFE

_phip      = 0.5  # fator de escala sainda da melhor posicao da particula
_phig      = 0.5  # fator de escala para buscar saindo da melhor posicao do enxame
_minfunc   = 1e-8 # menor mudanca na funcao objetivo que termina
_minstep   = 1e-8 # tamanho de passo minimo da melhor posicao do enxame antes que a busca termine
_maxiter   = 100  # maximo de iteracoes
_omega     = 0.5  # Fator de escala da velocidade da particula
_swarmsize = 100  # tamanho do enxame
_recombination = 0.7
estrategia = 'best1bin'
_mutation   = (0.5, 1)

for i in [15]:
 rp = 10**i
 x0 = asarray( [45.,30.,5.] ) * (pi/180) # theta_1, theta_2, theta_3
 x_classico = minimize(\
                      method='powell',\
                      fun=funcao_pseudo(rp),\
                      x0=x0,\
                      options={'disp':True},\
                      callback=save
                      ).x
 x_classico = tuple(x_classico * (180./pi))
 print(x_classico)
 g_classico = sum(map( lambda _: round(_,4), restricoes(x_classico)))

 x_de = de_min(\
                              funcao_pseudo(rp),\
                              bounds=[(-a, 0.0), (0.0, a),\
                              (-0.00499048, -0.00499048)],\
                              strategy=estrategia,\
                              maxiter=_maxiter,\
                              popsize=_swarmsize,\
                              tol=_minfunc,\
                              mutation=_mutation,\
                              recombination=_recombination,\
                              init='latinhypercube',\
                              disp='False'\
                              ).x

 #x_de = tuple(x_de * (180./pi))
 g_de = sum(map( lambda _: round(_,4), restricoes(x_de)))


 lb = [-a, 0.0, -0.00499048]
 ub = [0.0, a, -0.00499048+10**(-10)]

 x_pso = pso_min(\
             funcao_pseudo(rp),\
             lb, ub,\
             maxiter=200,\
             phip=_phip,\
             phig=_phig,\
             minfunc=_minfunc,\
             minstep=_minstep,\
             omega=_omega,\
             debug=False,\
             swarmsize=_swarmsize\
             )[0]
 print(F(x_pso,rp))
 #x_pso = tuple(x_pso * (180./pi))
 g_pso = sum(map( lambda _: round(_,4), restricoes(x_pso)))
 print("{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}".format(rp,x_classico,F(x_classico,rp),g_classico,x_de,F(x_de,rp),g_de,x_pso,F(x_pso,rp),g_pso))
