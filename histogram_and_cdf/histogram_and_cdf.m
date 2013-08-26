clc; clear all;

% Create histograms and cdfs from column data

% importdata(filename, delimiter, num_headerlines)
M = importdata('example_data/column_data.txt', ' ', 0);

% Row of histograms
for i=2:4
    subplot(2,3,i-1);
    
    % hist(values, num_bins)
    hist(M(:,i), 20);
    set(get(gca,'child'), 'FaceColor', 0.2*ones(1,3), 'EdgeColor', 'none');
    
    grid on;
    xlabel('Values');
    ylabel('Frequency');
    title(['Column ' num2str(i)]);
    axis square;
end

% Row of CDFs
for i=2:4
    subplot(2,3,(i-1)+3);
    
    % cdf
    h = cdfplot(M(:,i));
    set(h, 'color', 0.2*ones(1,3), 'linewidth', 2);
    grid on;
    xlabel('Values');
    ylabel('CDF');
    title('');
    axis square;
end