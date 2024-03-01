%% 1) Use the Q function to calculate the error probability for equiprobable binary antipodal modulation (PAM) given a AWGN channel with an ebno = 7 dB.
x = -4:0.1:4;
y = qfunc(x);
plot(x,y)
grid
ebnodB = 7;
ebno = 10^(ebnodB/10);
Pb = qfunc(sqrt(2*ebno));
fprintf('Error probability of Qfunction: %f\n', Pb);
%% 2) Using your PAM modulator & demodulator from Assignment 4, calculate the error probability using 10,000 input data points.
k = 1;
m = 2^k;
n = [10000, 1];
i_data = randi(0:m-1,n);
tx_sig = pammod(i_data, m);
SNR = 10;
rx_sig = awgn(tx_sig, SNR);
o_data = pamdemod(rx_sig, m);
errors = sum(i_data ~= o_data);
fprintf('Number of errors with Qfunction: %i\n', errors);
scatterplot(rx_sig);
title("PAM Constellation (PAM M=2)")

