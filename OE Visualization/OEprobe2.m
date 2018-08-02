
t = 0;
for tet = 1
    t = t+1;
    [data1, ~, info] = load_open_ephys_data(sprintf('102_CH%i.continuous', tet));
    [data2, ~, ~] = load_open_ephys_data(sprintf('102_CH%i.continuous', tet+1));
    [data3, ~, ~] = load_open_ephys_data(sprintf('102_CH%i.continuous', tet+2));
    [data4, ~, ~] = load_open_ephys_data(sprintf('102_CH%i.continuous', tet+3));
    [dataE,~,~] = load_open_ephys_data('100_ADC5.continuous');
    
    figure;
    plot(data1);
    hold on;
    plot(data2);
    plot(data3);
    plot(data4);
    plot(dataE*1000);
%     set(gca, 'xlim', z);
    title(sprintf('Probe%i Raw', t));
    drawnow
end

%%
t = 0;
for tet = 1:4:32
    t = t+1;
    [data1, ~, info] = load_open_ephys_data(sprintf('100_CH%i.continuous', tet));
    [data2, ~, ~] = load_open_ephys_data(sprintf('100_CH%i.continuous', tet+1));
    [data3, ~, ~] = load_open_ephys_data(sprintf('100_CH%i.continuous', tet+2));
    [data4, ~, ~] = load_open_ephys_data(sprintf('100_CH%i.continuous', tet+3));
    [dataE,~,~] = load_open_ephys_data('100_ADC5.continuous');
    
    samp = info.header.sampleRate;
    tsVect = (1:length(data1))/samp;
    [b1, a1] = butter(2, [59/(samp/2) 61/(samp/2)], 'stop');                      %% Remove 60hz Harmonic (noise)
    data1 = filtfilt(b1, a1, data1);
    data2 = filtfilt(b1, a1, data2);
    data3 = filtfilt(b1, a1, data3);
    data4 = filtfilt(b1, a1, data4);
    
    [~, data1] = PhaseFreqDetectAbbr(data1, tsVect, 1, 300);
    [~, data2] = PhaseFreqDetectAbbr(data2, tsVect, 1, 300);
    [~, data3] = PhaseFreqDetectAbbr(data3, tsVect, 1, 300);
    [~, data4] = PhaseFreqDetectAbbr(data4, tsVect, 1, 300);
        
    figure;
    plot(tsVect,data1);
    hold on;
    plot(tsVect,data2);
    plot(tsVect,data3);
    plot(tsVect,data4);
    plot(tsVect,dataE*1000);
%     set(gca, 'xlim', z);
    title(sprintf('Probe%i Raw', t));
    drawnow
end