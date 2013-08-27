stacked_area
============

The stacked area plot puts the cumulative sum of the columns on the Y axis.

An interesting drawback of matplotlib here is that it needs some extra help to
draw a legend.
We had to create what the matplotlib documentation calls "proxy artists," the colored rectangles produced by the list comprehension of lines 41-42 of `stacked_area.py`.
These have the same appearance as the filled areas, and so they appear correct in the legend.

Another interesting thing about this example is the difference in column indexing.
Matlab requires numerical columns, so we write `M(:,1)`.
Pandas allows us to use named columns instead, so we write `table["X"]` instead.

Finally, note the use of `.values`.
The column `table["X"]` is a `Series`, but matplotlib assumes that its inputs are `numpy` arrays.
Pandas stores its data in `numpy` arrays, so we can pass that array to a matplotlib plotting function by sending it `table["X"].values`, which is the underlying `numpy` array.
This is something to remember when writing scripts that use matplotlib with pandas: weird exceptions from deep inside matplotlib may mean that matplotlib expected a `numpy` array but got a `Series` instead.
