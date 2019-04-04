function [meanAx] = PlotLineAndFilledError(xVals, lineMean, lineVar, color)
%% PlotLineAndFilledError
%
%
%%
if diff(size(xVals))<0
    xVals = xVals';
end
meanAx = plot(xVals, lineMean, 'color', color);
hold on;
patch(gca, 'XData', [xVals, fliplr(xVals)],...
    'YData', [lineMean+lineVar, fliplr(lineMean+lineVar)],...
    'FaceColor', color, 'FaceAlpha', 0.15,...
    'EdgeColor', color);
