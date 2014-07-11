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
from mpl_toolkits.mplot3d import Axes3D

table = pandas.read_table("../example_data/gridded_2D.txt", 
                          sep=' ', header=None) 
griddata = table.values
norm = matplotlib.colors.Normalize(0, 1)

fig = matplotlib.figure.Figure() # create the figure
agg.FigureCanvasAgg(fig)         # attach the rasterizer

ax = fig.add_subplot(1, 3, 1)    # make axes to plot on
grid = numpy.arange(0, 1.0001, 0.01) 
cmap = matplotlib.cm.get_cmap("hot")
contourset = ax.contour(grid, grid, griddata, cmap=cmap, norm=norm)
cbar = fig.colorbar(contourset, ax=ax)
ax.set_title("Contour Plot of Gridded 2D Data")
ax.set_xticks([0, 0.5,1.0])
ax.set_yticks([0, 0.5,1.0])

ax = fig.add_subplot(1,3,2)
contourset = ax.contourf(grid, grid, griddata, cmap=cmap, norm=norm)
cbar = fig.colorbar(contourset, ax=ax)
ax.set_title("Filled Contour Plot of Gridded 2D Data")
ax.set_xticks([0, 0.5,1.0])
ax.set_yticks([0, 0.5,1.0])

ax = fig.add_subplot(1,3,3, projection='3d')
contourset = ax.plot_surface(grid, grid, griddata, cmap=cmap, 
                             norm=norm, linewidth=0)
try:
    ax.set_title("Surface Plot of Gridded 2D Data")
except AttributeError:
    # work around a bug in the axes3d implementation
    ax.set_title("Surface Plot of Gridded 2D Data", "center")
    
ax.set_xticks([0, 0.5,1.0])
ax.set_yticks([0.5,1.0])
ax.set_zticks(numpy.arange(0,1,0.2))

cbar = fig.colorbar(contourset, ax=ax)
fig.set_figheight(3)
fig.set_figwidth(15)
fig.savefig("contour_surf.png")

# vim:ts=4:sw=4:expandtab:ai:colorcolumn=68:number:fdm=indent
