'''
Created on Jul 11, 2014

@author: Victoria Lynn Ward
vlw27@cornell.edu
Cornell University
python script for a 5 objective 3d scatter plot
'''
from matplotlib import pyplot
import pylab as p
#from matplotlib.backends import backend_agg as agg #raster backend
from mpl_toolkits.mplot3d import Axes3D
import pandas # data analysis library

#load data
table = pandas.read_table("./myLake4ObjStoch.reference",
                          sep=' ', header=None,
                          names=["obj1", "obj2", "obj3","obj4"])

table.obj2 = -1*table.obj2
table.obj3 = -1*table.obj3
table.obj4 = -1*table.obj4

fig = p.figure() # create the figure
#agg.FigureCanvasAgg(fig) # attach the rasterizer
ax3D = Axes3D(fig)
#ax3D = fig.add_subplot(111, projection='3d')

cmap = pyplot.cm.get_cmap("jet")
pts = ax3D.scatter(table.obj1, table.obj2,table.obj3,
                    c=table.obj4,cmap=cmap, linewidth=0)

fig.colorbar(pts,ax=ax3D,shrink=0.75)
fig.axes[-1].set_ylabel("Reliability")

ax3D.set_xlabel("Phosphorus")
ax3D.set_ylabel("Benefit")
ax3D.set_zlabel("Inertia")
ax3D.set_title("4 objective lake problem")
p.show()

fig.savefig("scatter_plot_3d.png")



