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
two_y_axes_twinx.py
Make a single plot with two series having different Y axis scales.

This related StackOverflow question has a great answer by Joe Kington:
http://stackoverflow.com/questions/7733693/matplotlib-overlay-plots-with-different-scales
"""

import matplotlib              # plotting library
import matplotlib.mlab as mlab # matlab compatibility functions
from matplotlib.backends import backend_agg as agg # raster backend
import pandas       # data analysis library
import numpy        # numerical routines

def execute(fig):

    table = pandas.read_table("../example_data/column_data.txt", 
                              sep=' ', header=None, 
                              names=["X", "Y1", "Y2", "Y3"]) 

    ax1 = fig.add_subplot(1, 1, 1)    # make first axes to plot on

    # make new axes *almost* in the same position, but not quite
    bbx = ax1.get_position()
    left, bottom = bbx.p0
    jitter = 0.001
    position = [left+jitter, bottom, bbx.width, bbx.height]
    # exactly the same position makes matplotlib think you want ax1
    ax2 = fig.add_axes(position) 
    position[0] -= jitter 
    ax2.set_position(position) # nudge ax2 back into alignment

    y1 = ax1.plot(table.X, table.Y1, "k-", linewidth=4)
    y2 = ax2.plot(table.X, table.Y2 * 2,  "k--", linewidth=4)

    ax1.zorder = 1
    ax2.zorder = 0 # ax2 under ax1

    ax1.patch.set_alpha(0.3) # partially transparent 
    ax2.set_xticklabels([])
    ax1.yaxis.tick_left()
    ax2.yaxis.tick_right()

    ax1.set_title("Dual Axis Plot of Column Data")
    ax1.legend((y1[0], y2[0]), ("Y1", "Y2"), loc="lower right")

if __name__ == "__main__":
    fig = matplotlib.figure.Figure() # create the figure
    agg.FigureCanvasAgg(fig)         # attach the rasterizer
    execute(fig)
    fig.savefig("two_y_axes_manual.png")

# vim:ts=4:sw=4:expandtab:ai:colorcolumn=68:number:fdm=indent
