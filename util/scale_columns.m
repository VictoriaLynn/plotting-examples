function [A] = scale_columns(A, mins, maxes)
    
    % Redefine column values of a matrix such that maxes -> 1 and mins -> 0
    if length(A(1,:)) ~= length(mins) || length(A(1,:)) ~= length(maxes)
        error('Error: length of mins/maxes must be equal to number of columns in A');
    end

    for i=1:length(A(1,:)) 
        A(:,i) = (A(:,i) - mins(i))./(maxes(i) - mins(i)); 
    end

end
