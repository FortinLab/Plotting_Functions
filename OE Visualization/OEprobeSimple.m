%% For RAW trace
t = 0;
for tet = 1:4:64
    t = t+1;
    [data1, ~, ~] = load_open_ephys_data(sprintf('100_CH%i.continuous', tet));
    [data2, ~, ~] = load_open_ephys_data(sprintf('100_CH%i.continuous', tet+1));
    [data3, ~, ~] = load_open_ephys_data(sprintf('100_CH%i.continuous', tet+2));
    [data4, ~, ~] = load_open_ephys_data(sprintf('100_CH%i.continuous', tet+3));
    
    figure;
    plot(data1);
    hold on;
    plot(data2);
    plot(data3);
    plot(data4);
%     set(gca, 'xlim', z);
    title(sprintf('Probe%i Raw', t));
    drawnow
end
%% For Bandpass Filtered traces
t = 0;
for tet = 1:4:64
    t = t+1;
    [data1, ~, ~] = load_open_ephys_data(sprintf('102_CH%i.continuous', tet));
    [data2, ~, ~] = load_open_ephys_data(sprintf('102_CH%i.continuous', tet+1));
    [data3, ~, ~] = load_open_ephys_data(sprintf('102_CH%i.continuous', tet+2));
    [data4, ~, ~] = load_open_ephys_data(sprintf('102_CH%i.continuous', tet+3));
    
    figure;
    plot(data1);
    hold on;
    plot(data2);
    plot(data3);
    plot(data4);
%     set(gca, 'xlim', z);
    title(sprintf('Probe%i Filtered', t));
    drawnow
end