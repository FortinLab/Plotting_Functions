function [rVal,pVal] = corrScatPlot(xDta, yDta, xLbl, yLbl, varargin)
%% Correlation Scatter Plot
% [rVal, pVal] = corrScatPlot(xDta, yDta, xLbl, yLbl, varargin);
% xDta = X-data
% yDta = Y-data
% xLbl = X-axis Label
% yLbl = Y-axis Label
%%
if nargin == 2
    xLbl = [];
    yLbl = [];
end
if strcmp(varargin, 'zroNaN')
    xNanLog = isnan(xDta);
    yNanLog = isnan(yDta);
    xDta(xNanLog | yNanLog) = 0;
    yDta(xNanLog | yNanLog) = 0;
elseif strcmp(varargin, 'rmvNaN')
    xNanLog = isnan(xDta);
    yNanLog = isnan(yDta);
    xDta(xNanLog | yNanLog) = [];
    yDta(xNanLog | yNanLog) = [];
elseif strcmp(varargin, 'rmvZro')
    zroLog = xDta==0 | yDta==0;
    xDta(zroLog) = [];
    yDta(zroLog) = [];    
end
if strcmp(varargin, 'rmvNaNinf')
    xNanInfLog = isnan(xDta) | isinf(xDta);
    yNanInfLog = isnan(yDta) | isinf(yDta);
    xDta(xNanInfLog | yNanInfLog) = [];
    yDta(xNanInfLog | yNanInfLog) = [];
end
[r, p] = corr(xDta, yDta, 'rows', 'pairwise');
scatPlot = scatter(xDta, yDta);
if sum(strcmp(varargin, 'markerStyle'))>=1
    mrkrSpt = find(strcmp(varargin, 'markerStyle'));
    set(scatPlot, 'Marker', varargin{mrkrSpt+1});
end
if sum(strcmp(varargin, 'markerColor'))>=1
    clrSpt = find(strcmp(varargin, 'markerColor'));
    set(scatPlot, 'MarkerEdgeColor', varargin{clrSpt+1});
end
hold on
data = [xDta,yDta];
data(sum(isnan(data),2)>=1,:) = [];
eq1 = polyfit(data(:,1),data(:,2),1);
vCalc1 = polyval(eq1, data(:,1));
plot(data(:,1), vCalc1, 'red', 'linewidth', 2);
if p<=0.05
    annotation(gcf, 'textbox', get(gca, 'position'), 'string',...
     sprintf('r=%.02f; p = %.02f', r, p), 'linestyle', 'none', 'color', 'r');
else
    annotation(gcf, 'textbox', get(gca, 'position'), 'string',...
     sprintf('r=%.02f; p = %.02f', r, p), 'linestyle', 'none');
end
xlabel(xLbl);
ylabel(yLbl);

rVal = r;
pVal = p;
if sum(strcmp(varargin, 'coordOn'))==1
    hold on
    line(get(gca, 'xlim'), [0 0], 'linewidth', 0.5, 'linestyle', ':', 'color', 'black')
    line([0 0], get(gca, 'ylim'), 'linewidth', 0.5, 'linestyle', ':', 'color', 'black')
end
if sum(strcmp(varargin, 'gridOn'))==1
    grid on;
end

drawnow;