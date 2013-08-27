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
animated_gif.py
Produce frames for an animated gif
"""

import matplotlib              # plotting library
import matplotlib.mlab as mlab # matlab compatibility functions
from matplotlib.backends import backend_agg as agg # raster backend
import pandas       # data analysis library
import numpy        # numerical routines
import os           # for mkdir

try:
    os.mkdir("frames")
except FileExistsError:
    pass # it's ok if the directory is already there
    
xx = numpy.arange(0,2*numpy.pi,0.01)
omega = 0.5

for tt in range(50):
    fig = matplotlib.figure.Figure() # create the figure
    agg.FigureCanvasAgg(fig)         # attach the rasterizer
    ax = fig.add_subplot(1, 1, 1)    # make axes to plot on

    ax.plot(xx, numpy.sin(tt * omega + xx), linewidth=2, color='r')
    ax.set_ylim(-1,1)
    ax.set_xlim(0, 2*numpy.pi)
    ax.grid()

    fig.savefig("frames/frame{0}".format(str(tt).rjust(2, "0")))

# vim:ts=4:sw=4:expandtab:ai:colorcolumn=68:number:fdm=indent
