M = 16; 
txfilter = comm.RaisedCosineTransmitFilter;
rxfilter = comm.RaisedCosineReceiveFilter;
hpa = comm.MemorylessNonlinearity('Method','Saleh model', ...
    'InputScaling',-10,'OutputScaling',0);
x = randi([0 M-1],1000,1);
modSig = qammod(x,M,'UnitAveragePower',true);
txSigNoFilter = hpa(modSig);
filteredSigal = txfilter(modSig);
release(hpa)
txSig = hpa(filteredSigal);
rxSig = rxfilter(txSig);

% Filter Delay
tx_filter_delay = mean(grpdelay(txfilter));
rx_filter_delay = mean(grpdelay(rxfilter));

% modifying inputs/outputs

aligned_modSig = modSig(tx_filter_delay+1:end-rx_filter_delay);
aligned_rxSig = rxSig(tx_filter_delay+1:end-rx_filter_delay);

% Adding a demodulator
demodSig = qamdemod(aligned_rxSig, M, 'UnitAveragePower', true);

x_adjusted = x(1:length(demodSig));
BERnofilter = biterr(x_adjusted, demodSig) / length(x_adjusted);
BERfilter = biterr(x_adjusted, qamdemod(aligned_modSig, M, 'UnitAveragePower', true)) / length(x_adjusted);
fprintf('BER without filtering: %f\n', BERnofilter);
fprintf('BER with filtering: %f\n', BERfilter);
