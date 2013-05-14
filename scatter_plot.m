clc; clear all;

% Create scatter plot from non-gridded 2D data

% importdata(filename, delimiter, num_headerlines)
M = importdata('example_data/non_gridded_2D.txt', ' ', 0);

% scatter(x, y, size, color)
% Colors are specified as [r g b] in range 0-1
% Or if color is the same size as x and y, values are mapped to colormap
scatter(M(:,1), M(:,2), 60, M(:,3), 'filled');

xlabel('X');
ylabel('Y');
title('Scatter Plot of Non-Gridded 2D Data');
grid on; 

caxis([0 100]);
colormap(jet);
ch = colorbar;
set(ch, 'YTick', [0 50 100]);
set(get(ch, 'ylabel'), 'string', 'Z');