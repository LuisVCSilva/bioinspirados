# Import modules
import matplotlib.pyplot as plt
import numpy as np
from problema import *
# Import PySwarms
import pyswarms as ps
from pyswarms.utils.functions import single_obj as fx
from pyswarms.utils.plotters import (plot_cost_history, plot_contour, plot_surface)

options = {'c1':0.5, 'c2':0.3, 'w':0.9}
optimizer = ps.single.GlobalBestPSO(n_particles=50, dimensions=2, options=options)
cost, pos = optimizer.optimize(funcao_objetivo, iters=100)

from pyswarms.utils.plotters.formatters import Mesher

m = Mesher(func=fx.sphere)

animation = plot_contour(pos_history=optimizer.pos_history,
                         mesher=m,
                         mark=(0,0))

animation.save('plot0.gif', writer='imagemagick', fps=10)
