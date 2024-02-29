% Define the input binary data sequence
data = [1, 1, 0,0, 0, 0, 1];

% Define the time axis
T = length(data);
t = 0:T-1;

% Initialize the polar NRZI signal with the first data bit
polar_nrzi = data(1);

% Generate the polar NRZI signal
for i = 2:T
    if data(i) == data(i-1)
        polar_nrzi = [polar_nrzi, polar_nrzi(end)];
    else
        polar_nrzi = [polar_nrzi, -polar_nrzi(end)];
    end
end

% Plot the generated polar NRZI signal
plot(t, polar_nrzi, 'LineWidth', 2);
xlabel('Time (t)');
ylabel('Amplitude (V)');
title('Polar NRZI');
grid on;