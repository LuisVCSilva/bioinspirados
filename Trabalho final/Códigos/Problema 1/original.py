#!/usr/bin/env python
import numpy as np; 
from numpy import asarray, sqrt
from powell import powell

# Make sure everything is in SI units: 
a = 150 * 1.e-3 # meters 
b = 50 * 1.e-3 # meters 
k = 0.6 * 1.e+3 # Newtons/meter
P = 5 # Newtons 

def objective_fn(x):
    """
    The function we want to minimize.
    """
    u, v = x
    delta_AB = sqrt( (a+u)**2 + v**2 ) - a 
    delta_BC = sqrt( (b-u)**2 + v**2 ) - b
    return - P * v + ( ( k * ( a + b ) )/( 2 * a ) ) * delta_AB**2 + ( ( k * ( a + b ) )/( 2 * b ) ) * delta_BC**2 

#
xStart = asarray( [0.,0.] )
x, numIter = powell( objective_fn, xStart, 0.01 ) 
print "Minimium point (mm)= ", x * 1000.
print "Function value= ", objective_fn(x)
print "numIter= ", numIter
