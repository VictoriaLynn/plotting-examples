"""
Copyright (C) 2013 Matthew Woodruff

This script is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This script is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this script. If not, see <http://www.gnu.org/licenses/>.

===========================================================
contour_surf.py
Reproduce the behavior of Jon's contour_surf.m using
matplotlib and pandas
"""

import matplotlib              # plotting library
import matplotlib.mlab as mlab # matlab compatibility functions
from matplotlib.backends import backend_agg as agg # raster backend
import pandas       # data analysis library
import numpy        # numerical routines

table = pandas.read_table("example_data/gridded_2D.txt", 
                          sep=' ', header=None) 
griddata = table.values
fig = matplotlib.figure.Figure() # create the figure
agg.FigureCanvasAgg(fig)         # attach the rasterizer

ax = fig.add_subplot(1, 3, 1)    # make axes to plot on
grid = numpy.arange(0, 1.0001, 0.01) 
cmap = matplotlib.cm.get_cmap("hot")
contourset = ax.contour(grid, grid, table.values, cmap=cmap)
cbar = fig.colorbar(contourset)
cbar.set_ticks([0.0,1.0])

fig.savefig("contour_surf.png")

# vim:ts=4:sw=4:expandtab:ai:colorcolumn=68:number:fdm=indent
