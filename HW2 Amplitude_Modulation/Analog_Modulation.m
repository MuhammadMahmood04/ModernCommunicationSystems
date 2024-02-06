%% transmitter
%% Muhammad Mahmood (c) 2024
%% clear everything
clear; close all; clc;

%% set parameters
OverSampling=20;
freq = 1010E3;
amplitude = 1;
T = 0.001;
bb_freq = 5000.0;
bb_amp = 1;
ko = 1;

%%create Timebase
fs = OverSampling*max(freq);
t = 0:1/fs:T - 1/fs;
N = length(t);

%% create carrier
sig = cos(2.0*pi*freq*t);

%% Create Baseband signal
bb_sig = bb_amp*cos(2.0*pi*bb_freq*t);

%% Amplitude Modulation
Modulated = (amplitude +bb_sig).*sig;
%% Amplitude Modulation using ammod function
modulated_ammod = ammod(bb_sig, freq, fs, 0, amplitude);

%%plot results m  
figure, subplot(3,1,1)
plot(t, bb_sig)
xlabel("Time seconds")
ylabel("Amplitude")
title("Baseband Signal Time Domain")

subplot(3,1,2)
plot(t, Modulated)
title("Amplitude Modulation time Domain")
xlabel("Time (Seconds)")
ylabel("Amplitude")

subplot(3, 1, 3);
plot(t, modulated_ammod);
xlabel('Time (s)');
ylabel('Amplitude');
title('AM Modulated Signal (Using ammod)');


