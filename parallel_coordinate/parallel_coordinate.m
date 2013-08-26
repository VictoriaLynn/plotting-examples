clc; clear all;
addpath util

% Create parallel coordinate plots from column data
% (using each row of data for one parallel line entry)

% importdata(filename, delimiter, num_headerlines)
M = importdata('example_data/column_data.txt', ' ', 0);

% re-map the values in M to [0, 1] for consistent plotting
M = scale_columns(M, min(M), max(M));

% define "brushing" thresholds
% useful to focus on a few solutions instead of all at once
% thresholds row format: column number, threshold value, less than (-1) or greater than (1)
% not all columns need to have thresholds applied
thresholds = [2 0.2 1; 4 0.5 -1]; 
[brush_on_idx, brush_off_idx] = brush_solutions(M, thresholds);

% brush_on_idx now contains the indices of the rows of M that satisfy:
% Column 2 greater than 0.2 (scaled value)
% Column 4 less than 0.5 (scaled value)
% brush_off_idx contains the remaining indices that do not satisfy these.
   
% plot the brushed off solutions first in gray
plot(1:4, M(brush_off_idx, :), 'color', 0.85*ones(1,3));
hold on; grid on;

% choose a column to use for coloring the brushed-on solutions (optional)
column_color = 1;

% we have to set the color of each line manually
% first get a matrix of color values
if(length(brush_on_idx) > 0)
    color_values = M(brush_on_idx, column_color); 
    cmap = jet;
    num_colors = length(cmap);
    colormap(cmap);
end

% plot each brushed-on solution with a color mapped to a value
for i=1:length(brush_on_idx)
    current_color = cmap(floor(color_values(i)*(num_colors-1))+1, :);
    plot(1:4, M(brush_on_idx(i),:), 'color', current_color, 'linewidth', 2);
end

hcb = colorbar; caxis([0 1]);
set(get(hcb, 'ylabel'), 'String', 'Column 1 Value');
set(hcb, 'ytick', [0 1]);

ylim([0 1]);
set(gca, 'YTick', [0 1], 'XTick', [1 2 3 4]);
set(gca, 'XTickLabel', {'Column 1', 'Column 2', 'Column 3', 'Column 4'});
ylabel('Scaled Values');
title('Parallel Coordinate Plot of Column Data');




