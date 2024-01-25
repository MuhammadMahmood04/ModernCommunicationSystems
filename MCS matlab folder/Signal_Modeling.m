% Parameters
frequency = 100e6; 
amplitude = 10;   
period = 1e-6;    
Over_sampling = 20;

% Time Base
fs = Over_sampling*max(frequency);
time = 0:1/fs:period-1/fs;

% Create cosine signal
cosine_signal = amplitude * cos(2*pi*frequency*time);

% Plot time domain response
plot(time,cosine_signal)
xlabel('Time in s')
ylabel('Amplitude in V')
title('Carrier Time Domain')