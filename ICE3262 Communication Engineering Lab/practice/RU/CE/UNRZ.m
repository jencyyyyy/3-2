function [t,x] = UNRZ(bits,bitrate)

T = length(bits)/bitrate; % full time of bit sequence
%sampling rate
n = 200;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t)); % output signal

for i=0:length(bits)-1
    if bits(i+1) == 1
        x(i*n+1:(i+1)*n) = 1;
    else
        x(i*n+1:(i+1)*n) = 0;
    end
end

%------Demodulation-----

counter = 0;
result = zeros(1,length(bits));
for i=1:length(t)
    if t(i)>counter
        counter = counter +1 ;
        result(counter) = x(i);
    end
end
disp('Unipolar NRZ decoding:');
disp(result);
        
