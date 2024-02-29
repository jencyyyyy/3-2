clear all
%bits= input('enter bits');
bits=[1 0 1 0 1 1];
bitlen=length(bits);
bitrate=1;
T=bitlen/bitrate;
sample=100;
sampleRate=1/sample;

t=0:sampleRate:(T-sampleRate);
lenT = length(t);
modulation = zeros(1,lenT);

for i=1:bitlen
    if bits(i) ==1
        modulation((i-1)*sample+1:i*sample) = 1;
    end
end

plot(t,modulation, 'Linewidth',2 );
yticks([-1 0 1]);
axis([0 bitlen -1 1.5])
grid on;

checkSampleIndex=0;

demodulation=zeros(1,bitlen);
for i= 1: lenT
    if t(i)>checkSampleIndex
        checkSampleIndex=checkSampleIndex+1;
        demodulation(checkSampleIndex)=modulation(i);
        
    end    
end
disp("Demodulation of NRZ")
disp(demodulation)
        