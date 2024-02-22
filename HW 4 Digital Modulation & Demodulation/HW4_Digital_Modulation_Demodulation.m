%% 1)Create 10,000 input data with a random distribution. Since we will work with bandwidth efficient modulations where k>1 and M>2, first define k and M and then use randi to create the random data.
%2)Modulate & demodulate using PAM with M=2 and show constellation.

k = 1;
M = 2^k;
N = [10000, 1];
i_data = randi(0:M-1,N);
%Modulate and demodulate
tx_sig = pammod(i_data, M);
o_data = pamdemod(tx_sig, M);
errors = sum(i_data ~= o_data);
fprintf('Number of errors with PAM (M=2): %i\n', errors);
%Plot constellation
figure;
scatterplot(tx_sig);
title("PAM Constellation (M=2)")
%% 3)Repeat with k=3 and M=8
k = 3;
M = 8;
N = [10000*k 1];
i_data = randi([0 1], N);
%Modulate and demodulate
tx_sig = pammod(i_data, M);
o_data = pamdemod(tx_sig, M);
errors = sum(i_data ~= o_data);
fprintf('Number of errors with PAM (M=8): %i\n', errors);
%Plot constellation
figure;
scatterplot(tx_sig);
title("PAM Constellation (M=8)")
%% 4)Repeat it for QAM
k=3;
M = 8;
N = [10000*k 1];
i_data = randi([0 1], N);
%Modulate and demodulate
tx_sig = qammod(i_data, M, InputType="bit", UnitAveragePower=true,PlotConstellation=true);
o_data = qamdemod(tx_sig, M);
fprintf('Number of errors with QAM (M=8): %i\n', errors);
%Plot constellation
figure;
scatterplot(tx_sig);
title("QAM Constellation (M=8)")
%% 5)Repeat it for 64-QAM
k = 3;
M = 64;
N = [10000*k 1];
i_data = randi([0 1], N);
%Modulate and demodulate
tx_sig = qammod(i_data, M, InputType="bit", UnitAveragePower=true, PlotConstellation=true);
o_data = qamdemod(tx_sig, M);
fprintf('Number of errors with QAM (M=64): %i\n', errors);
%Plot constellation
figure;
scatterplot(tx_sig);
title("QAM Constellation (M=64)")
%% 6)Repeat it for 8-PSK
k = 3;
M = 8;
N = [10000*k 1];
i_data = randi([0 M-1], N);
%Modulate and demodulate
tx_sig = pskmod(i_data, M);
o_data = pskdemod(tx_sig, M);
errors = sum(i_data ~= o_data);
fprintf('Number of errors with PSK (M=8): %i\n', errors);
%Plot constellation
figure;
scatterplot(tx_sig);
title("8-PSK Constellation (M=8)")
%% 7)Modulate 64-QAM with gray coding, demodulate with binary coding
tx_sig = qammod(i_data, M, "gray");
o_data = qamdemod(tx_sig, M);
errors = sum(i_data ~= o_data);
fprintf('Number of errors with 64-QAM (Gray mod, Binary demod): %i\n', errors);
%Demodulate with Gray coding
o_data_gray = qamdemod(tx_sig, M, "gray");
errors_gray = sum(i_data ~= o_data);
fprintf('Number of errors with 64-QAM (Gray demod): %i\n', errors_gray);
%% 8)Add AWGN with SNR=20 dB for 64-QAM and 8-PSK
SNR = 20;
rx_sig = awgn(tx_sig, SNR);
o_data = qamdemod(rx_sig, M);
errors = sum(i_data ~= o_data);
fprintf('Number of errors with 64-QAM and SNR=20 dB: %i\n', errors);
figure;
scatterplot(rx_sig);
title("Received Constellation (64-QAM, SNR=20 dB)")
%% 9)Repeat it for SNR=12dB
SNR = 12;
rx_sig = awgn(tx_sig, SNR);
o_data = qamdemod(rx_sig, M);
errors = sum(i_data ~= o_data);
fprintf('Number of errors with 64-QAM and SNR=12 dB: %i\n', errors);
figure;
scatterplot(rx_sig);
title("Received Constellation (64-QAM, SNR=12 dB)")
%% 10) Create 8-PSK waveform and add AWGN as an impairment at 12 dB SNR
tx_sig = pskmod(i_data, M);
rx_sig = awgn(tx_sig, SNR);
figure;
scatterplot(rx_sig);
title("Received Constellation (8-PSK, SNR=12 dB)")