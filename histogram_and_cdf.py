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
histogram_and_cdf.py
Reproduce the behavior of Jon's histogram_and_cdf.m using
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

for ii in range(2,5):
    ax = fig.add_subplot(2,3,ii-1)
    col = table.icol(ii-1)
    ax.hist(col, bins=20, color='k', linewidth=0)

    # fiddle with ticks to make the plots look the same
    ax.set_xticks([0, 0.5, 1.0])
    ax.set_yticks({2: range(0, 21, 5), 
                   3: range(0, 7, 2),
                   4: range(0, 81, 20)}[ii])
    ax.grid()

    ax.set_title("Column {0}".format(ii))
    ax.set_ylabel("Frequency")
    ax.set_xlabel("Values")

    ax = fig.add_subplot(2,3,ii+2)
    # this bit is to get smooth lines like in the matlab example
    # for stairsteps, remove this code and use the commented bit
    # below
    col = col.order()
    total = len(col)
    cdf = [float(ii) / total for ii in range(total)]
    ax.plot(col, cdf, '-', linewidth=2, color='k')

    # stairstep plot, not smooth like the example
    # ax.hist(table.icol(ii-1), bins=20, color='k', linewidth=2,
    #         normed=True, histtype='step', cumulative=True)

    ax.set_xticks([0, 0.5, 1.0])
    ax.set_yticks([0, 0.5, 1.0])
    ax.set_ylim(0,1)
    ax.grid()
    ax.set_ylabel("CDF")
    ax.set_xlabel("Values")

fig.set_figwidth(10)
fig.set_figheight(6)

fig.savefig("histogram_and_cdf")

# vim:ts=4:sw=4:expandtab:ai:colorcolumn=68:number:fdm=indent
