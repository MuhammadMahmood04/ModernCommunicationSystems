%% Create 10,000 input data with a random distribution. Since we will work with bandwidth efficient modulations where k>1 and M>2, first define k and M and then use randi to create the random data. 
k = 1;
M = 2^k;
N = [10000, 1];
i_data = randi(0:M-1,N);
%% Modulate & demodulate using PAM with M=2 and show constellation. Use pammod & pamdemod. Compare output data with input data and report number of errors
tx_sig = pammod(i_data, M);
o_data = pamdemod(tx_sig, M);
errors = sum(i_data ~= o_data);
fprintf('Number of errors with PAM (M=2): %i\n', errors);
scatterplot(tx_sig);
title("PAM Constellation (M=2)")
%% Repeat with k=3 and M=8
k = 3;
M = 8;
N = [10000*k 1];
i_data = randi([0 M-1], N);
tx_sig = pammod(i_data, M);
o_data = pamdemod(tx_sig, M);
errors = sum(i_data ~= o_data);
fprintf('Number of errors with PAM (M=8): %i\n', errors);
scatterplot(tx_sig);
title("PAM Constellation (M=8)")
%% Repeat with QAM
k = 3;
M = 8;
N = [10000*k 1];
i_data = randi([0 1], N);
tx_sig = qammod(i_data, M, InputType="bit", UnitAveragePower=true,PlotConstellation=true);
o_data = qamdemod(tx_sig, M);
fprintf('Number of errors with QAM (M=8): %i\n', errors);
scatterplot(tx_sig);
title("QAM Constellation (M=8)")
%% Repeat for 64-QAM
k = 3;
M = 64;
N = [10000*k 1];
i_data = randi([0 1], N);
%Modulate and demodulate
tx_sig = qammod(i_data, M, InputType="bit", UnitAveragePower=true, PlotConstellation=true);
o_data = qamdemod(tx_sig, M);
fprintf('Number of errors with QAM (M=64): %i\n', errors);
%Plot constellation
scatterplot(tx_sig);
title("QAM Constellation (M=64)")
%% Repeat for 8-PSK
k = 3;
M = 8;
N = [10000*k 1];
i_data = randi([0 M-1], N);
tx_sig = pskmod(i_data, M);
o_data = pskdemod(tx_sig, M);
errors = sum(i_data ~= o_data);
fprintf('Number of errors with PSK (M=8): %i\n', errors);
scatterplot(tx_sig);
title("8-PSK Constellation (M=8)")
%% Modulate 64-QAM with gray coding and demodulate using binary coding
tx_sig = qammod(i_data, M, "gray");
o_data = qamdemod(tx_sig, M);
errors = sum(i_data ~= o_data);
fprintf('Number of errors with 64-QAM (Gray mod, Binary demod): %i\n', errors);
o_data_gray = qamdemod(tx_sig, M, "gray");
errors_gray = sum(i_data ~= o_data);
fprintf('Number of errors with 64-QAM (Gray demod): %i\n', errors_gray);
%% 64-QAM for awgn with 20 db
k = 3;
M = 64;
N = [10000*k 1];
i_data = randi([0 1], N);
tx_sig = qammod(i_data, M, InputType="bit", UnitAveragePower=true, PlotConstellation=true);
rx_sig=awgn(tx_sig, 20);
fprintf('Number of errors with QAM (M=64 with db of 20): %i\n', errors);
scatterplot(rx_sig);
title("QAM Constellation (M=64 of 20db)")
%% 8psk add awgn with 20db
k = 3;
M = 8;
N = [10000*k 1];
i_data = randi([0 M-1], N);
tx_sig = pskmod(i_data, M);
rx_sig = awgn(tx_sig,20);
o_data = pskdemod(rx_sig, M);
errors = sum(i_data ~= o_data);
fprintf('Number of errors with PSK (M=8 with db of 20): %i\n', errors);
scatterplot(rx_sig);
title('Received 8-PSK Constellation with AWGN (SNR=20 dB)');
%% 64-QAM for awgn with 12 db
k = 3;
M = 64;
N = [10000*k 1];
i_data = randi([0 1], N);
tx_sig = qammod(i_data, M, InputType="bit", UnitAveragePower=true, PlotConstellation=true);
rx_sig=awgn(tx_sig,12);
fprintf('Number of errors with QAM (M=64 with db of 12): %i\n', errors);
scatterplot(rx_sig);
title("QAM Constellation (M=64 of 12db)")
%% for 8psk add awgn with 12db
k = 3;
M = 8;
N = [10000*k 1];
i_data = randi([0 M-1], N);
tx_sig = pskmod(i_data, M);
rx_sig = awgn(tx_sig,12);
o_data = pskdemod(rx_sig, M);
errors_psk8_awgn20 = sum(i_data ~= o_data);
fprintf('Number of errors with PSK (M=8 with db of 12): %i\n', errors);
scatterplot(rx_sig);
title('Received 8-PSK Constellation with AWGN (SNR=12 dB)');