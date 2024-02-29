bits = input('Enter input sequence:');
bitrate = 1;
n = 1000;
len = length(bits);
T = length(bits)/bitrate;
N = n*len;
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t));

for i=1:length(bits)
  if bits(i)==1
    x((i-1)*n+1:i*n) = 1;
  end
end
plot(t, x, 'Linewidth', 3);
xticks([0:len])
yticks([0: 1])
grid on
title('Unipolar NRZ');