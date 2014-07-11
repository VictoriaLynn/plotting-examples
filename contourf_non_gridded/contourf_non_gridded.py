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
contourf_non_gridded.py
Reproduce the behavior of Jon's contourf_non_gridded.m using 
matplotlib and pandas
"""

import matplotlib              # plotting library
import matplotlib.mlab as mlab # matlab compatibility functions
from matplotlib.backends import backend_agg as agg # raster backend
import numpy        # numeric library
import pandas       # data analysis library

table = pandas.read_table("../example_data/non_gridded_2D.txt", 
                          sep=' ', header=None, 
                          names=["x", "y", "z"])
ticks = numpy.arange(0,10,0.1)
grid = mlab.griddata(table.x.values, table.y.values, table.z.values, 
                     ticks, ticks)

# plot
fig = matplotlib.figure.Figure() # create the figure
agg.FigureCanvasAgg(fig)         # attach the rasterizer
ax = fig.add_subplot(1, 1, 1)    # make axes to plot on
ax.set_title("Interpolated Contour Plot of Experimental Data")
ax.set_xlabel("X")
ax.set_ylabel("Y")

cmap = matplotlib.cm.get_cmap("hot") # get the "hot" color map
contourset = ax.contourf(ticks, ticks, grid, 10, cmap=cmap)

cbar = fig.colorbar(contourset)
cbar.set_ticks([0,100])
fig.axes[-1].set_ylabel("Z") # last axes instance is the colorbar

fig.savefig("contourf_non_gridded.png")

# vim:ts=4:sw=4:expandtab:ai:colorcolumn=68:number:fdm=indent
