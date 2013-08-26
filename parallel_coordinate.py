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

scaled = table.copy()
for column in table.columns:
    mm = table[column].min()
    mx = table[column].max()
    scaled[column] = (table[column] - mm) / (mx - mm)

brushing = (scaled[1] > 0.2) & (scaled[3] < 0.5)

cmap = matplotlib.cm.get_cmap("jet")

# draw gray "brushed off" solutions
# The xor (^) inverts the brushing
for solution in scaled[brushing ^ True].iterrows():
    ys = solution[1]
    xs = range(len(ys))

    ax.plot(xs, ys, "-", color=(0.85,0.85,0.85), linewidth=2)

for solution in scaled[brushing].iterrows():
    ys = solution[1]
    xs = range(len(ys))

    ax.plot(xs, ys, c=cmap(ys[0]), linewidth=2)

sm = matplotlib.cm.ScalarMappable(cmap=cmap)
sm.set_array([0.0,1.0])

cbar = fig.colorbar(sm)

cbar.ax.set_ylabel("Scaled Column 1 Value")

ax.set_title("Parallel Coordinate Plot of Column Data")
ax.set_ylabel("Scaled Values")
ax.set_xticks([0,1,2,3])
ax.set_xticklabels(["Column {0}".format(ii) for ii in range(1,5)])

fig.set_figwidth(11)
fig.savefig("parallel_coordinate.png")

# vim:ts=4:sw=4:expandtab:ai:colorcolumn=68:number:fdm=indent
