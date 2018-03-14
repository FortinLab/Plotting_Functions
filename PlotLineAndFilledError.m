function PlotLineAndFilledError(xVals, lineMean, lineVar, color)
%% PlotLineAndFilledError
%
%
%%
jbfill(xVals,lineMean+lineVar,lineMean-lineVar,color,color,0,.2);
hold on;
plot(xVals, lineMean, 'color', color);
