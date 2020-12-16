from problema import *
from scipy.optimize import minimize,differential_evolution as de_min
from pyswarm import pso as pso_min
from powell import *

x0 = array([1.,1.])
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

x_classico = minimize(method='powell',fun=funcao_objetivo, x0=x0,tol=_minfunc,options={'disp':False,'return_all':False}).x
#x_classico  = powell(funcao_objetivo,x,h=0.1,tol=1.0e-8)
x_de = de_min(\
                              funcao_objetivo,\
                              bounds=[(-a, a), (-a, a)],\
                              strategy=estrategia,\
                              maxiter=_maxiter,\
                              popsize=_swarmsize,\
                              tol=_minfunc,\
                              mutation=_mutation,\
                              recombination=_recombination,\
                              disp=False,\
                              init='latinhypercube'\
                              ).x


lb = [-a, -a]
ub = [a,   a]

x_pso = pso_min(\
             funcao_objetivo,\
             lb, ub,\
             maxiter=200,\
             phip=_phip,\
             phig=_phig,\
             minfunc=_minfunc,\
             minstep=_minstep,\
             omega=_omega,\
             swarmsize=_swarmsize,\
             debug=False)[0]



print("{}\t{}\t{}\t{}\t{}\t{}".format("Powell - x","Powell - f(x)","DE - x","DE - f(x)","PSO - x","PSO - f(x)"))
print("{}\t{}\t{}\t{}\t{}\t{}".format(x_classico,funcao_objetivo(x_classico),x_de,funcao_objetivo(x_de),x_pso,funcao_objetivo(x_pso)))
