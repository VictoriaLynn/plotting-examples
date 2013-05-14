## Matlab Plotting Examples
#### Some examples for plotting different types of data

##### Column data

From `example_data/column_data.txt`. Used with:

* `line_plot.m`: Standard line plot with different formatting options

* `stacked_area.m`: Stacked area plot with color options

* `histogram_cdf.m`: Standard plots of frequency distributions

* `parallel_coordinate.m`: Plots row entries as lines instead of columns. Options to scale all values between `[0,1]` and toggle solutions on/off above/below a certain threshold. (These functions are included in `/util/`).

##### Gridded 2D data

From `example_data/gridded_2D.txt`. Used with:

* `imagesc_plot.m`: Show matrix values directly as color blocks

* `contour_surf.m`: Contour, filled contour, and surface plots of meshgrid data

##### Non-Gridded 2D data (experimental)

From `example_data/non_gridded_2D.txt`. The data file contains rows of `(x,y,z)` points that are not on a regular grid. Used with:

* `scatter_plot.m`: Plot the irregularly spaced points as dots, with `Z` values as the color

* `contourf_non_gridded.m`: Use Matlab's built-in `griddata` function to interpolate the data onto a standard meshgrid, which can then be used for standard contour/mesh/surf plots, etc.