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
stacked_area.py
Reproduce the behavior of Jon's stacked_area.m using
matplotlib and pandas
"""

import matplotlib              # plotting library
import matplotlib.mlab as mlab # matlab compatibility functions
from matplotlib.backends import backend_agg as agg # raster backend
import pandas       # data analysis library
import numpy        # numerical routines

fig = matplotlib.figure.Figure() # create the figure
agg.FigureCanvasAgg(fig)         # attach the rasterizer
ax = fig.add_subplot(1, 1, 1)    # make axes to plot on

names = ["X", "Series 1", "Series 2", "Series 3"]
table = pandas.read_table("../example_data/column_data.txt", 
                          sep=' ', header=None, names=names)

ax.grid()
colors = [(0,0,0,1), (0.75,0.75,0.75,1), (1,0,0,1)]
ax.stackplot(table["X"].values,
             table["Series 1"].values, 
             table["Series 2"].values, 
             table["Series 3"].values,
             colors = colors)
proxies = [matplotlib.patches.Rectangle((0,0),1,1, fc=color) 
           for color in colors]

ax.legend(proxies, names[1:], loc="lower right")
ax.set_xlabel("X")
ax.set_ylabel("Sum of Y values")
ax.set_title("Stacked Area Plot of Column Data")

fig.savefig("stacked_area")

# vim:ts=4:sw=4:expandtab:ai:colorcolumn=68:number:fdm=indent
