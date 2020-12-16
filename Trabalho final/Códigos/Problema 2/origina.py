import numpy as np; from numpy import asarray, pi, cos, sin
from scipy.optimize import minimize,differential_evolution as de_min

from powell import powell

L_1 = 1.2
L_2 = 1.5
L_3 = 1.0
B = 3.5 
H = 0 
W_1 = 20 * 1.e3
W_2 = 30 * 1.e3

def objective_fn(x):
    """
    The function we want to minimize.
    """
    t_1, t_2, t_3 = x 
    return - W_1 * L_1 * sin(t_1) - W_2 * ( L_1 * sin(t_1) + L_2 * sin(t_2) )

def constraint_fns(x): 
    """
    A tuple of constraints we want to be <= 0.
    """
    t_1, t_2, t_3 = x 
    C1_residual = B - ( L_1 * cos(t_1) + L_2 * cos(t_2) + L_3 * cos(t_3) )
    C2_residual = H - ( L_1 * sin(t_1) + L_2 * sin(t_2) + L_3 * sin(t_3) )
    return ( abs(C1_residual), abs(C2_residual), )

def lagrangian_function(lam): 
    """
    Given a value of lambda returns a function of x that we can minimize with a minimization routine.
    """
    return lambda _ : F(_,lam)

def F(x,lam): 
    """
    Given lambda returns the value of the objective function 
    """
    objective = objective_fn(x)
    penalties = map( lambda _: max(_,0)**2, constraint_fns(x) )
    penalty = sum( penalties ) 
    return objective + lam * penalty 

rp = 10**10
x0 = asarray( [45.,30.,5.] ) * (pi/180) # theta_1, theta_2, theta_3
x, numIter = powell( objective_fn, x0, 1e-6 )
print(x_classico,F(x_classico,rp))
