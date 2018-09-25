for c = 2:size(behavMatrix,2)-2
    scatter(find(behavMatrix(:,c)==1), ones(sum(behavMatrix(:,c)==1),1)*c, 'd');
    hold on; 
    scatter(find(behavMatrix(:,c)==-1), ones(sum(behavMatrix(:,c)==-1),1)*c, '*');
end