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
scatter.py
Reproduce the behavior of Jon's scatter.m using
matplotlib and pandas
"""

import matplotlib              # plotting library
import matplotlib.mlab as mlab # matlab compatibility functions
from matplotlib.backends import backend_agg as agg # raster backend
import pandas       # data analysis library
import numpy        # numerical routines

table = pandas.read_table("example_data/non_gridded_2D.txt", 
                          sep=' ', header=None, 
                          names=["x", "y", "z"])
fig = matplotlib.figure.Figure() # create the figure
agg.FigureCanvasAgg(fig)         # attach the rasterizer
ax = fig.add_subplot(1, 1, 1)    # make axes to plot on

cmap = matplotlib.cm.get_cmap("jet")
pts = ax.scatter(table.x, table.y, s=60, c=table.z, cmap=cmap, 
                 linewidth=0)
cbar = fig.colorbar(pts, ax=ax)
fig.axes[-1].set_ylabel("Z")

ax.grid()

ax.set_xlabel("X")
ax.set_ylabel("Y")
ax.set_xlim(0,10)
ax.set_ylim(0,10)
ax.set_title("Scatter Plot of Non-Gridded 2D Data")

fig.savefig("scatter_plot.png")

# vim:ts=4:sw=4:expandtab:ai:colorcolumn=68:number:fdm=indent
