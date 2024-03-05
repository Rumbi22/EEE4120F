% Call the function with N = 10 seconds and fs = 48000 Hz
white_noise = createwhiten(15000);

function white_noise = createwhiten(N)
fs = 48000;
% CREATEWHITEN Generates white noise signal of duration N seconds using a for loop
%   N: Duration of the white noise signal in seconds (must be a multiple of 10)
%   fs: Sampling frequency, either 48 kHz or 8 kHz

% Check if N is a positive multiple of 10
if mod(N, 10) ~= 0 || N <= 0
    error('Duration must be a positive multiple of 10 seconds');
end

% Calculate the number of samples
num_samples = N * fs;
tic()
% Generate white noise using a for loop
white_noise = zeros(1, num_samples);
for i = 1:num_samples
    white_noise(i) = randn(); % Generate a single random value
end
toc()
% Normalize white noise to have max amplitude of 1
white_noise = white_noise / max(abs(white_noise));

% Save white noise as a WAV file
filename = sprintf('white_noise_%dsec_%dkHz.wav', N, fs/1000);
audiowrite(filename, white_noise, fs);

% Display information
disp(['White noise saved as "', filename, '"']);
disp(['Output size: ', num2str(size(white_noise))]);
end
