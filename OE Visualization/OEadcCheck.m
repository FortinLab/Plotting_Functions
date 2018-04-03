[dataA,~,~] = load_open_ephys_data('100_ADC1.continuous');
[dataB,~,~] = load_open_ephys_data('100_ADC2.continuous');
[dataC,~,~] = load_open_ephys_data('100_ADC3.continuous');
[dataD,~,~] = load_open_ephys_data('100_ADC4.continuous');
[dataE,~,~] = load_open_ephys_data('100_ADC5.continuous');
[dataF,~,~] = load_open_ephys_data('100_ADC6.continuous');
[dataG,~,~] = load_open_ephys_data('100_ADC7.continuous');
[dataH,~,~] = load_open_ephys_data('100_ADC8.continuous');

figure;
plot(dataA); 
hold on; 
plot(dataB);
plot(dataC)
plot(dataD)
plot(dataE)
plot(dataF)
plot(dataG)
plot(dataH);