close all;
clear all;
clc;
%bits=input("Enter bits: ");
bits = [0 1 1 1 0 0 0 1 0 1];
bitrate = 1;
fs = 100;

T = length(bits) * bitrate;
t = 0:1/fs:T-(1/fs);

for i = 1:length(bits)
  if bits(i) == 0
    x((i-1)*fs*bitrate+1:i*fs*bitrate) = zeros(1, fs*bitrate);
  else
    x((i-1)*fs*bitrate+1:i*fs*bitrate) = ones(1, fs*bitrate);
  end
end

subplot(3,1,1);
plot(t, x, 'linewidth', 3);
%ylim([-3, 3]);
title("Input Signal");

a = 5;
f = 3;

carrier = a * sin ( 2* pi * f * t);
subplot(3,1,2);
plot(t, carrier);
title("Carrier signal"); 


% Modulation
m = x.*carrier;
subplot(3,1,3);
plot(t, m);
title("ASK"); 
