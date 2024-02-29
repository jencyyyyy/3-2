% A N D A 

%----   Korlamna ! kar ki?   -----





function [t,x] = MLT3(bits,bitrate)

T = length(bits)/bitrate; % full time of bit sequence
n = 200;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t)); % output signal

lastbit = 1;

for i=0:length(bits)-1
    if bits(i+1) == 1
        if lastbit == 0
            x(i*n+1:(i+1)*n) = -lastbit;
            lastbit = -lastbit;
        else
             x(i*n+1:(i+1)*n) = 0;
                lastbit = -lastbit;
        end
    end
end
