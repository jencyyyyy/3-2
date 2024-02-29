bits = input('Enter the bit stream');
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
len = length(bits);
N = n*len;
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t));
lastbit = 1;
for i=1:len
  if bits(i)==1
    x((i-1)*n+1:i*n) = -lastbit;
    lastbit = -lastbit;
  else x((i-1)*n+1:i*n) = lastbit;
  end
end
plot(t, x, 'Linewidth', 3);
xticks([0:len])
yticks([-1: 1])
grid on
title('Polar Non-return to zero Inverse');
