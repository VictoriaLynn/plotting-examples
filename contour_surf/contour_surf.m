clc; clear all;

% Create contour and surface plots of gridded 2D data

% importdata(filename, delimiter, num_headerlines)
M = importdata('../example_data/gridded_2D.txt', ' ', 0);

% To use contour, contourf, and surf, X and Y must form a meshgrid
[X, Y] = meshgrid(0:0.01:1, 0:0.01:1);

subplot(1,3,1);
contour(X, Y, M);
title('Contour Plot of Gridded 2D Data');

subplot(1,3,2);
contourf(X, Y, M, 'edgecolor', 'none');
title('Filled Contour Plot of Gridded 2D Data');

subplot(1,3,3);
hs = surf(X, Y, M);
title('Surface Plot of Gridded 2D Data');

% Remove black edges from surface plot to see colors more clearly
set(hs, 'edgecolor', 'none');
% Set the viewing angle (usually can be rotated in the window without this)
az = 45;
el = 30;
view(az, el);

% Set some common info for all three subplots
for i=1:3
    subplot(1,3,i);
    xlabel('X');
    ylabel('Y');
    axis square;

    caxis([0 1]);
    colormap(hot);
     
    if(i < 3)
        ch = colorbar;
        set(ch, 'YTick', [0 1]);
        set(get(ch, 'ylabel'), 'string', 'Z');
    end
end