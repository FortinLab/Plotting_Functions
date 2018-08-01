function [meanAx] = PlotLineAndFilledError(xVals, lineMean, lineVar, color)
%% PlotLineAndFilledError
%
%
%%
jbfill(xVals,lineMean+lineVar,lineMean-lineVar,color,color,0,.2);
hold on;
meanAx = plot(xVals, lineMean, 'color', color);
