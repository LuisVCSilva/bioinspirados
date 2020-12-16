from numpy import *

a = 150 * 1.e-3  # m
b = 50 *  1.e-3  # m
k = 0.6 * 1.e+3  # N/m
P = 5            # N

def funcao_objetivo(x):
    u, v = x
    delta_AB = sqrt((a+u)**2 + v**2) - a 
    delta_BC = sqrt((b-u)**2 + v**2) - b
    return -P * v + ((k * (a + b))/(2*a)) * delta_AB**2 + ((k*(a+b))/(2*b)) * delta_BC**2
