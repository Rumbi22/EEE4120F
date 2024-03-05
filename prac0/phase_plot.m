% Define the transfer function
num = [1];
den = [1, 0];
G = tf(num, den);

N = 0.5*G+1;

D = 0.81*G^2 - 1.8*cos(pi/16)*G + 1;

F = N/D;

% Print out the transfer function
figure;
bode(F);
title('Magnitude-Phase Plot');
