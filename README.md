## Plotting Examples
#### Some examples for plotting different types of data in Matlab and Python
Contributors: [jdherman](https://github.com/jdherman) and [matthewjwoodruff](https://github.com/matthewjwoodruff)

See [`example_images`](https://github.com/jdherman/plotting-examples/tree/master/line_plot) for the outputs from these files (PNG). Note that publication-quality figures will usually require a vector graphics format (SVG/EPS/PDF) along with some manual editing to improve font clarity, etc. The examples shown here are in unedited raster format and are only meant to be illustrative.

##### Column data

From `example_data/column_data.txt`. Used with:

* [`line_plot`](https://github.com/jdherman/plotting-examples/tree/master/line_plot): Standard line plot with different formatting options

![Image](https://raw.github.com/jdherman/plotting-examples/master/example_images/line_plot.png)

* [`fill_between`](https://github.com/jdherman/plotting-examples/tree/master/fill_between): Same data as `line_plot`, with shaded fill between Series 1 and Series 2

![Image](https://raw.github.com/jdherman/plotting-examples/master/example_images/fill_between.png)

* [`dual_axis`](https://github.com/jdherman/plotting-examples/tree/master/dual_axis): Plot column data using two different Y-axes

![Image](https://raw.github.com/jdherman/plotting-examples/master/example_images/dual_axis.png)

* [`stacked_area`](https://github.com/jdherman/plotting-examples/tree/master/stacked_area): Stacked area plot with color options

![Image](https://raw.github.com/jdherman/plotting-examples/master/example_images/stacked_area.png)

* [`animated_gif`](https://github.com/jdherman/plotting-examples/tree/master/animated_gif): Save loop of images as a `.gif` animation.  The Python version requires you to use `imagemagick` after the fact to stick the frames together: `convert -delay 15 -loop 0 frame*png animation.gif`.

![Image](https://raw.github.com/jdherman/plotting-examples/master/example_images/animated_sinewave.gif)

* [`histogram_cdf`](https://github.com/jdherman/plotting-examples/tree/master/histogram_cdf): Standard plots of frequency distributions

![Image](https://raw.github.com/jdherman/plotting-examples/master/example_images/histogram_and_cdf.png)

* [`parallel_coordinate`](https://github.com/jdherman/plotting-examples/tree/master/parallel_coordinate): Plots row entries as lines instead of columns. Options to scale all values between `[0,1]` and toggle solutions on/off above/below a certain threshold. (These functions are included in `/util/`).

![Image](https://raw.github.com/jdherman/plotting-examples/master/example_images/parallel_coordinate.png)

##### Gridded 2D data

From `example_data/gridded_2D.txt`. Used with:

* [`imagesc_plot`](https://github.com/jdherman/plotting-examples/tree/master/imagesc_plot): Show matrix values directly as color blocks

![Image](https://raw.github.com/jdherman/plotting-examples/master/example_images/imagesc_plot.png)

* [`contour_surf`](https://github.com/jdherman/plotting-examples/tree/master/contour_surf): Contour, filled contour, and surface plots of meshgrid data

![Image](https://raw.github.com/jdherman/plotting-examples/master/example_images/contour_surf.png)

##### Non-Gridded 2D data (e.g. experimental data)

From `example_data/non_gridded_2D.txt`. The data file contains rows of `(x,y,z)` points that are not on a regular grid. Used with:

* [`scatter_plot`](https://github.com/jdherman/plotting-examples/tree/master/scatter_plot): Plot the irregularly spaced points as dots, with `Z` values as the color

![Image](https://raw.github.com/jdherman/plotting-examples/master/example_images/scatter_plot.png)

* [`contourf_non_gridded`](https://github.com/jdherman/plotting-examples/tree/master/contourf_non_gridded): Use Matlab's built-in `griddata` function to interpolate the data onto a standard meshgrid, which can then be used for standard contour/mesh/surf plots, etc.

![Image](https://raw.github.com/jdherman/plotting-examples/master/example_images/contourf_non_gridded.png)

