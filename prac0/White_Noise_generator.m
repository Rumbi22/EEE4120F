% Define parameters
duration = 100; % Duration of the white noise in seconds
fs = 48000; % Sampling frequency (48 kHz)

tic();
% Generate white noise
white_noise = randn(1, duration * fs);

% Normalize white noise to have max amplitude of 1
white_noise = white_noise / max(abs(white_noise));
toc();
% Save white noise as a WAV file
filename = 'white_noise.wav';
audiowrite(filename, white_noise, fs);

disp('White noise saved as "white_noise.wav"');
