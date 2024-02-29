f=2;
a=3;
sample=100;
sampleRate=1/sample;

t= 0:sampleRate:(2-sampleRate);

xt= a*sin(2*pi*f*t);
figure(1)
plot(t,xt)
grid on


%digital
fs=6*f;
ts=1/fs;
n = 0:ts:(fs*ts-ts);

xn = a*sin(2*pi*f*n);

figure(2)
stem(n,xn);




