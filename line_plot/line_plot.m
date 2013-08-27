clc; clear all;

% Create line plot from column data

% importdata(filename, delimiter, num_headerlines)
M = importdata('../example_data/column_data.txt', ' ', 0);

% plot(x, y, style, ...)
% possible styles include:
% '-' (line)
% '--' (dashed)
% '-.' (dash-dot)
% '.' (markers only)
% ':' (dotted)
% Colors are specified as [r g b] in range 0-1
plot(M(:,1), M(:,2), '-', 'color', [0 0 0], 'linewidth', 2);
hold on;
plot(M(:,1), M(:,3), '--', 'color', 'r', 'linewidth', 2);
plot(M(:,1), M(:,4), '-', 'color', 0.75*ones(1,3), 'linewidth', 3);

xlabel('X');
ylabel('Y');
title('Line Plot of Column Data');
grid on; 
legend({'Series 1', 'Series 2', 'Series 3'}, 'location', 'southeast');