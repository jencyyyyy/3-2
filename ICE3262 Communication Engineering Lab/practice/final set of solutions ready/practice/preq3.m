% Binary sequence
binarySequence = [1, 0, 1, 1, 0, 1, 0, 1];

% Parameters
samplingFrequency = 20; % Sampling frequency (in Hz)
duration = 1; % Duration of each bit (in seconds)

% Time vector
t = 0:1/samplingFrequency:duration;

% Empty array for modulated signal
modulatedSignal = [];

% Modulation
for bit = binarySequence
    if bit == 0
        % Modulate with 5 Hz signal
        modulatedBit = sin(2*pi*5*t);
    else
        % Modulate with 10 Hz signal
        modulatedBit = sin(2*pi*10*t);
    end
    
    % Append modulated bit to the signal
    modulatedSignal = [modulatedSignal, modulatedBit];
end

% Plot the modulated signal as a stem plot
figure;
stem(modulatedSignal);
xlabel('Sample');
ylabel('Amplitude');
title('Modulated Signal');