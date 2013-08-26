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
fill_between.py
Add shading between lines to line_plot.py
"""

import matplotlib              # plotting library
import matplotlib.mlab as mlab # matlab compatibility functions
from matplotlib.backends import backend_agg as agg # raster backend
import pandas       # data analysis library
import numpy        # numerical routines

table = pandas.read_table("../example_data/column_data.txt", 
                          sep=' ', header=None, 
                          names=["x", "y", "z", "w"])
fig = matplotlib.figure.Figure() # create the figure
agg.FigureCanvasAgg(fig)         # attach the rasterizer
ax = fig.add_subplot(1, 1, 1)    # make axes to plot on
ax.plot(table.x, table.y, '-', color='k', linewidth=2, label="Series 1")
ax.plot(table.x, table.z, '--', color='r', linewidth=2, label="Series 2")

# Fill between table.y and table.z
# where= is an optional parameter that I use to fill only where
# the sinusoid (y) is above the line (z).
# Appending .values is necessary for some matplotlib functions
# because they can get confused by the way pandas subscripts series.
# Putting .values after a column name gives you a numpy array 
# containing the data, which is what matplotlib expects.
# color=(0.5, 0.5, 1.0, 0.2) is a tuple specifying the color
# red = 0.5, green = 0.5, blue = 1.0, alpha = 0.2,
# where alpha is for transparency.  (Each element in the color
# should be between 0 and 1.)
ax.fill_between(table.x.values, table.y.values, table.z.values, 
                where=(table.y > table.z), color=(0.5,0.5,1.0,0.2))


ax.set_xticks(numpy.arange(0, 10, 1))
ax.set_yticks(numpy.arange(0,1,0.1))
ax.legend(loc=4)
ax.grid()

ax.set_xlabel("X")
ax.set_ylabel("Y")
ax.set_title("Line Plot of Column Data")

fig.savefig("fill_between.png")

# vim:ts=4:sw=4:expandtab:ai:colorcolumn=68:number:fdm=indent

