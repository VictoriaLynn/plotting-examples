clc; clear all;

% Create imagesc plot of gridded 2D data
% imagesc is useful because it only plots the data points you have
% unlike contourf, which interpolates between the points.
% thus imagesc is best for plotting matrix contents in color

% importdata(filename, delimiter, num_headerlines)
M = importdata('../example_data/gridded_2D.txt', ' ', 0);

% imagesc(x, y, Z)
% This will work for any dimension matrix Z (it doesn't have to be square)
% provided that it matches the dimensions of X and Y.
% Note that unlike contour and pcolor, imagesc does NOT require a meshgrid
% (x and y are just vectors, but M is a matrix)
x = 0:0.01:1;
y = 0:0.01:1;
imagesc(x, y, M);

% by default, the imagesc plot will be flipped upside-down
% set YDir to normal to fix this
set(gca,'YDir','normal');

xlabel('X');
ylabel('Y');
title('Imagesc Plot of Gridded 2D Data');

caxis([0 1]);
colormap(hot);
ch = colorbar;
set(ch, 'YTick', [0 1]);
set(get(ch, 'ylabel'), 'string', 'Z');