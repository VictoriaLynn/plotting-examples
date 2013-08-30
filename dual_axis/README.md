Two Y Axes
==========

Having two y scales for two data series on the same plot is commonly done.  Excel makes it very easy.  Unfortunately, neither Matlab nor matplotlib makes it particularly straightforward.

Python notes
------------
Matplotlib has a built-in facility for doing this: `twinx`.  For slightly more flexibility, and the power to do weird stuff like partly obscuring one plot with another, you can manually place multiple axes over each other.  I demonstrate both approaches.  `dual_axis_manual.py` takes the manual approach, while `dual_axis_twinx.py` uses the built-in `twinx`.
