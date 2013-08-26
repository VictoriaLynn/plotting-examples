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
line_plot.py
Reproduce the behavior of Jon's line_plot.py using
matplotlib and pandas
"""

import matplotlib              # plotting library
import matplotlib.mlab as mlab # matlab compatibility functions
from matplotlib.backends import backend_agg as agg # raster backend
import pandas       # data analysis library
import numpy        # numerical routines

table = pandas.read_table("example_data/column_data.txt", 
                          sep=' ', header=None, 
                          names=["x", "y", "z", "w"])
fig = matplotlib.figure.Figure() # create the figure
agg.FigureCanvasAgg(fig)         # attach the rasterizer
ax = fig.add_subplot(1, 1, 1)    # make axes to plot on
ax.plot(table.x, table.y, '-', color='k', linewidth=2, label="Series 1")
ax.plot(table.x, table.z, '--', color='r', linewidth=2, label="Series 2")
ax.plot(table.x, table.w, '-', color=[0.75]*3, linewidth=3, label="Series 3")
ax.set_xticks(numpy.arange(0, 10, 1))
ax.set_yticks(numpy.arange(0,1,0.1))
ax.legend(loc=4)
ax.grid()

ax.set_xlabel("X")
ax.set_ylabel("Y")
ax.set_title("Line Plot of Column Data")

fig.savefig("line_plot.png")

# vim:ts=4:sw=4:expandtab:ai:colorcolumn=68:number:fdm=indent
