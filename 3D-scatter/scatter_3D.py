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
table = pandas.read_table("../example_data/five_obj_data.txt",
                          sep=' ', header=None,
                          names=["obj1", "obj2", "obj3","obj4","obj5"])

fig = p.figure() # create the figure
#agg.FigureCanvasAgg(fig) # attach the rasterizer
ax3D = Axes3D(fig)
#ax3D = fig.add_subplot(111, projection='3d')

obj5_in_points = ax3D.transData.transform(zip([0]*len(table.obj5), table.obj5)) 

cmap = pyplot.cm.get_cmap("jet")
pts = ax3D.scatter(table.obj1, table.obj2,table.obj3, s=obj5_in_points/5,
                    c=table.obj4,cmap=cmap, linewidth=0)

fig.colorbar(pts,ax=ax3D,shrink=0.75)
fig.axes[-1].set_ylabel("obj4")

ax3D.set_xlabel("obj1")
ax3D.set_ylabel("obj2")
ax3D.set_zlabel("obj3")
ax3D.set_title("Scatter Plot of 5 Objectives")
p.show()

fig.savefig("scatter_plot_3d.png")



