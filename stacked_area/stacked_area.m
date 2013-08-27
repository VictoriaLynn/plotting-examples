clc; clear all;

% Create line plot from column data

% importdata(filename, delimiter, num_headerlines)
M = importdata('../example_data/column_data.txt', ' ', 0);

% area(x, Ymatrix)
h = area(M(:,1), M(:,2:4));
set(h(1), 'FaceColor', [0 0 0]);
set(h(2), 'FaceColor', 0.75*ones(1,3));
set(h(3), 'FaceColor', 'r');

xlabel('X');
ylabel('Sum of Y Values');
title('Stacked Area Plot of Column Data');
grid on;
legend({'Series 1', 'Series 2', 'Series 3'}, 'location', 'southeast');