function [t,x] = NRZI(bits,bitrate)

T = length(bits)/bitrate; % full time of bit sequence
n = 1000;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t)); % output signal

lastbit = 1;

for i=0:length(bits)-1
    if bits(i+1) == 1
        x(i*n+1:(i+1)*n+1) = -lastbit;
        lastbit = -lastbit;
    else
        x(i*n+1:(i+1)*n+1) = lastbit;
    end
end


%------Demodulation-----

counter = 0;
lastbit = 1;
result = zeros(1,length(bits));
for i=1:length(t)
    if t(i)>counter
        counter = counter +1 ;
        if x(i)~=lastbit
            result(counter) = 1;
            lastbit = -lastbit;
        else result(counter) = 0;
        end
    end
end
disp('Polar NRZ-I decoding:');
disp(result);
