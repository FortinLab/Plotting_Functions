function BarPlotErrorbars(dataMeans, dataVar, varargin) 
%% BarPlotErrorbars
% Plot bar graphs with errorbars
% Note: dataMeans and dataVar must be vectors
%%
if ~(length(dataMeans) == length(dataVar))
    error('Means and Variance do not match');
end
if sum(cell2mat(cellfun(@(a)strcmp(a, 'Color'), varargin, 'uniformoutput',0)))>=1
    faceColor = varargin{find(cell2mat(cellfun(@(a)strcmp(a, 'Color'), varargin, 'uniformoutput',0)))+1};
else
    faceColor = 'none';
end
if sum(cell2mat(cellfun(@(a)strcmp(a, 'XTick'), varargin, 'uniformoutput',0)))>=1
    xTick = varargin{find(cell2mat(cellfun(@(a)strcmp(a, 'XTick'), varargin, 'uniformoutput', 0)))+1};
    if length(xTick)==1
        barWidth = 0.5;
    else
        barWidth = 1;
    end
    bar(xTick, dataMeans, barWidth, 'facecolor', faceColor);
    hold on
    errorbar(xTick, dataMeans, dataVar, 'linestyle', 'none', 'color', 'black', 'CapSize', 0);
else    
    bar(1:length(dataMeans), dataMeans, 'facecolor', faceColor);
    hold on
    errorbar(1:length(dataMeans), dataMeans,dataVar, 'linestyle', 'none', 'color', 'black', 'CapSize', 0);
end
