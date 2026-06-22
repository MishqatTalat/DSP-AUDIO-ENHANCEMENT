% DSP for Audio Enhancement Using MATLAB
clear; clc; close all;

%% Step 1: Load built-in audio signal
load gong.mat;       % Loads variables 'y' and 'Fs'
y = y / max(abs(y)); % Normalize amplitude to [-1, 1]

%% Step 2: Add Gaussian noise
% Reduced noise factor slightly to make enhancement mathematically visible
noise = 0.1 * randn(size(y)); 
noisy_signal = y + noise;

%% Step 3: Design moving average filter for high-frequency noise removal
% Butterworth sometimes attenuates the low sampling frequency gong signal too much.
% Moving Average is much more natural for simple sample projects.
windowSize = 8;
b = (1/windowSize)*ones(1, windowSize);
a = 1;

filtered_signal = filter(b, a, noisy_signal);

%% Step 4: Calculate SNR (Signal-to-Noise Ratio)
snr_before = snr(y, noise);
snr_after = snr(y, filtered_signal - y);

% Display results in command window
fprintf('--- Audio Enhancement Results ---\n');
fprintf('SNR Before Filtering: %.2f dB\n', snr_before);
fprintf('SNR After Filtering: %.2f dB\n', snr_after);

%% Step 5: Plot signals in Time Domain
t = (0:length(y)-1)/Fs;

figure('Name', 'Audio Enhancement Analysis', 'Position', [100, 100, 800, 600]);

subplot(3,1,1)
plot(t, y, 'b')
title('Original Clean Signal')
xlabel('Time (s)'); ylabel('Amplitude')
grid on;

subplot(3,1,2)
plot(t, noisy_signal, 'r')
title('Noisy Signal (with Gaussian Noise)')
xlabel('Time (s)'); ylabel('Amplitude')
grid on;

subplot(3,1,3)
plot(t, filtered_signal, 'g')
title('Filtered (Enhanced) Signal')
xlabel('Time (s)'); ylabel('Amplitude')
grid on;

%% Step 6: Audio Playback (Optional - uncomment to listen)
% sound(y, Fs);              % Clean audio
% pause(3);                  % Wait 3 seconds
% sound(noisy_signal, Fs);   % Noisy audio
% pause(3);
% sound(filtered_signal, Fs); % Enhanced audio