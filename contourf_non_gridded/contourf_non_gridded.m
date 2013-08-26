clc; clear all;

% Create contourf plot from non-gridded (experimental) data

% importdata(filename, delimiter, num_headerlines)
M = importdata('example_data/non_gridded_2D.txt', ' ', 0);

% M contains rows of (x,y,z) points that are not on a regular grid
x = M(:,1);
y = M(:,2);
z = M(:,3);

% define a regular grid to interpolate the experimental data
% (in this case, x and y were generated randomly on the interval [0, 10])
steps = 0:0.1:10;
[XI, YI] = meshgrid(steps, steps);
ZI = griddata(x, y, z, XI, YI);

% now you can use XI, YI, ZI to make contour/mesh/surface plots as usual
% keep in mind that the values are interpolated,
% so the smooth contours may be deceiving compared to the underlying data
% Note that colors do not extend to the edge of the plot because no data
% occurs in these bins

contourf(XI, YI, ZI, 'edgecolor', 'none');

title('Interpolated Contour Plot of Experimental Data');
xlabel('X');
ylabel('Y');
axis square;

caxis([0 100]);
colormap(hot);
ch = colorbar;
set(ch, 'YTick', [0 100]);
set(get(ch, 'ylabel'), 'string', 'Z');

