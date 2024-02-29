%Analog Signal
A=5;
f=2;

t=0:0.01:2;

xt=A*sin(2*pi*f*t);

figure(1);
subplot(1,2,1);
plot(t,xt);
axis([0 2 -A-2 A+2]);
yticks([-A 0 A]);
xlabel('Time(t)');
ylabel('Amplitude');
title('x(t)= A*sin(2*pi*f*t)');
grid on;

%digital

fs=10*f;
Ts=1/fs;
n=0:Ts:fs*Ts;
xn=A*sin(2*pi*f*n);

subplot(1,2,2);
stem(n,xn);

yticks([-A 0 A]);
xlabel('Time(t)');
ylabel('Amplitude');
title('x(n)= A*sin(2*pi*(f/fs)*n)');
grid on;

%composite

A1=4;
A2=5;
A3=2;

f1=2;
f2=3;
f3=1;

x1=A1*sin(2*pi*f1*t);
x2=A2*sin(2*pi*f2*t);
x3=A3*sin(2*pi*f3*t);

xf=x1+x2+x3;

figure(2);
stem(t,xf);


grid on;



