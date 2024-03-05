x = audioread("white_noise.wav");
y = x;

r1 = mycorr1(x,y);
r2 = corrcoef(x,y);
disp(r2(1,2) - r1);

y(1) = 2; y(5) = -4; % i.e. fudge some of the value
r1 = mycorr1(x,y);
r2 = corrcoef(x,y);
disp(r2(1,2) - r1);
x = rand(1,10); y = rand(1,10);
r1 = mycorr1(x,y); r2 = corrcoef(x,y);
disp(r2(1,2) - r1);


function correlation_coefficient = mycorr1(data1, data2)
% CALCULATE_CORRELATION Calculates the correlation coefficient between two data sets
%   data1: First data set
%   data2: Second data set

% Check if the input data sets have the same length
if numel(data1) ~= numel(data2)
    error('Data sets must have the same length');
end

% Calculate the means of the two data sets
mean_data1 = mean(data1);
mean_data2 = mean(data2);

% Calculate the covariance
covariance = sum((data1 - mean_data1) .* (data2 - mean_data2)) / numel(data1);

% Calculate the standard deviations
std_data1 = std(data1);
std_data2 = std(data2);

% Calculate the correlation coefficient
correlation_coefficient = covariance / (std_data1 * std_data2);
end
