function [brushOnIX, brushOffIX] = brush_solutions(A, thresholds)

    IX = 1:size(A,1);
    for i=1:length(thresholds(:,1))
        if(thresholds(i,3) == -1)
            tempIX = find(A(:,thresholds(i,1)) < thresholds(i,2));
        else
            tempIX = find(A(:,thresholds(i,1)) > thresholds(i,2));
        end

        IX = intersect(IX, tempIX);
    end

    brushOnIX = unique(IX);
    brushOffIX = setdiff(1:size(A,1), brushOnIX);

end
