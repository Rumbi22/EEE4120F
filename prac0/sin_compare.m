% Define parameters
amplitude = 1;       % Amplitude of the sine wave
frequency = 1/10;     % Frequency of the sine wave (in Hz)
phase = 0;           % Phase of the sine wave (in radians)
duration = 2 * 10;    % Duration of the sine wave to ensure at least 2 full periods
sampling_rate = 1; % Sampling rate (number of samples per second)

% Create a time vector for the original sine wave
t_original = linspace(0, duration, duration * sampling_rate);

% Generate the original sine wave
sine_wave_original = amplitude * sin(2 * pi * frequency * t_original + phase);

% Create a time vector for the shifted sine wave
shift_amount = 5; % Shift by half a period
t_shifted = t_original + shift_amount;

% Generate the shifted sine wave
sine_wave_shifted = amplitude * sin(2 * pi * frequency * t_shifted + phase);

% Plot the original sine wave
subplot(1, 2, 1);
plot(t_original, sine_wave_original, 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Sine Wave');
grid on;

% Plot the shifted sine wave
subplot(1, 2, 2);
plot(t_shifted, sine_wave_shifted, 'r', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Shifted Sine Wave');
grid on;

coef = corrcoef(sine_wave_shifted,sine_wave_original);

display(coef(1,2))
