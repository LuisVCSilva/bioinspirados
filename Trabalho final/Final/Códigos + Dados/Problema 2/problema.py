from numpy import *

L_1 = 1.2
L_2 = 1.5
L_3 = 1.0
B = 3.5 
H = 0 
W_1 = 20 * 1.e3
W_2 = 30 * 1.e3

def funcao_objetivo(x):
    t_1, t_2, t_3 = x 
    return - W_1 * L_1 * sin(t_1) - W_2 * ( L_1 * sin(t_1) + L_2 * sin(t_2) )

def restricoes(x): 
    t_1, t_2, t_3 = x 
    h_1 = B - ( L_1 * cos(t_1) + L_2 * cos(t_2) + L_3 * cos(t_3) )
    h_2 = H - ( L_1 * sin(t_1) + L_2 * sin(t_2) + L_3 * sin(t_3) )
    return ( abs(h_1), abs(h_2), )

def funcao_pseudo(lam): 
    return lambda _ : MPFE(_,lam)

def MPFE(x,lam):
    f_obj = funcao_objetivo(x)
    penalidades = map( lambda _: max(_,0)**2, restricoes(x) )
    penalidade_total = sum( penalidades ) 
    return f_obj + lam * penalidade_total
