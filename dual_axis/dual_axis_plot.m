clc; clear all;

% Create dual-axis plot from column data using plotyy function
M = importdata('../example_data/column_data.txt', ' ', 0);

[ax,h1,h2] = plotyy(M(:,1),M(:,2),M(:,1),2*M(:,3),'plot');
% to get both x axes to obey the limit:
set(ax,'XLim',[0 10]);
xlabel('X');
grid on;

% to fix colors of axes and labels to black - yes
set(ax(1),'YColor','k');
set(ax(2),'YColor','k');
% Set labels, limits, and ticks of each Y axis individually
set(get(ax(1),'YLabel'),'String','Y1');
set(get(ax(2),'YLabel'),'String','Y2');
set(ax(1),'YLim',[0 1]);
set(ax(2),'YLim',[0 2]);
set(ax(1),'YTick',[0:.2:1]);
set(ax(2),'YTick',[0:.4:2]);
% Remove Y1 ticks from right side and Y2 ticks from left side
set(ax(2),'Box','Off');
set(ax(1),'Box','Off');

% and finally the line specs
set(h1,'Color','k','LineWidth',4);
set(h2,'Color','k','LineStyle','--','LineWidth',4);
line(xshort,svshort,'Parent',ax(1),'Color','k','LineStyle',':','LineWidth',3);






