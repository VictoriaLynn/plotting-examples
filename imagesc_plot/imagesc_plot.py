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
imagesc_plot.py
Reproduce the behavior of Jon's imagesc_plot.m using
matplotlib and pandas
"""

import matplotlib              # plotting library
import matplotlib.mlab as mlab # matlab compatibility functions
from matplotlib.backends import backend_agg as agg # raster backend
import pandas       # data analysis library
import numpy        # numerical routines

table = pandas.read_table("../example_data/gridded_2D.txt", 
                          sep=' ', header=None) 
         
fig = matplotlib.figure.Figure() # create the figure
agg.FigureCanvasAgg(fig)         # attach the rasterizer
ax = fig.add_subplot(1, 1, 1)    # make axes to plot on

sm = ax.imshow(table.values, cmap = matplotlib.cm.get_cmap("hot"),
               origin="lower", extent=(0,1,0,1), 
               interpolation="none")

ax.set_xlabel("X")
ax.set_ylabel("Y")
ax.set_title("Imshow Plot of Gridded Data")

cbar = fig.colorbar(sm)

fig.savefig("imagesc_plot.png")

# vim:ts=4:sw=4:expandtab:ai:colorcolumn=68:number:fdm=indent
