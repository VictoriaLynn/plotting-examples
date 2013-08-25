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
parallel_coordinate.py
Reproduce the behavior of Jon's parallel_coordinate.m using
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

table = pandas.read_table("example_data/column_data.txt", 
                          sep=' ', header=None) 

mins = table.min()
maxs = table.max()

for column in table.columns:
    mm = table[column].min()
    mx = table[column].max()
    table[column] = (table[column] - mm) / (mx - mm)

print table[0:10]
#fig.savefig("imagesc_plot.png")

# vim:ts=4:sw=4:expandtab:ai:colorcolumn=68:number:fdm=indent
