clc;
clear all;
close all;

%bits = [1 0 1 0 0 0 1 1 0];
%bits = input('Enter bitstream:');
bits = [1 0 1 1 1 0 0 1];
%bitrate is the number of bit per sec
bitrate = 1;

figure;
% t =time duration s = corresponding output
[t,s] = UNRZ(bits,bitrate);
%linewidth 3 means the line will bold threee times than original signal
plot(t,s,'LineWidth',3);
set(gca,'YGrid','off','XGrid','on');
axis([0 t(end) -0.1 1.1])
title(['Unipolar NRZ : [' num2str(bits) ']']);

figure;
[t,s] = URZ(bits,bitrate);
plot(t,s,'LineWidth',3);
set(gca,'YGrid','off','XGrid','on');
axis([0 t(end) -0.1 1.1])
title(['Unipolar RZ : [' num2str(bits) ']']);


figure;
[t,s] = NRZL(bits,bitrate);
plot(t,s,'LineWidth',3);
set(gca,'YGrid','off','XGrid','on');
axis([0 t(end) -1.1 1.1])
title(['NRZ-L : [' num2str(bits) ']']);

figure;
[t,s] = NRZI(bits,bitrate);
plot(t,s,'LineWidth',3);
set(gca,'YGrid','off','XGrid','on');
axis([0 t(end) -1.1 1.1])
title(['NRZ-I : [' num2str(bits) ']']);


figure;
[t,s] = PRZ(bits,bitrate);
plot(t,s,'LineWidth',3);
set(gca,'YGrid','off','XGrid','on');
axis([0 t(end) -1.1 1.1])
title(['Polar RZ : [' num2str(bits) ']']);



figure;
[t,s] = Manchester(bits,bitrate);
plot(t,s,'LineWidth',3);
set(gca,'YGrid','off','XGrid','on');
axis([0 t(end) -1.1 1.1])
title(['Manchester : [' num2str(bits) ']']);


figure;
[t,s] = DiffManchester(bits,bitrate);
plot(t,s,'LineWidth',3);
set(gca,'YGrid','off','XGrid','on');
axis([0 t(end) -1.1 1.1])
title(['Differential Manchester : [' num2str(bits) ']']);

figure;
[t,s] = AMI(bits,bitrate);
plot(t,s,'LineWidth',3);
set(gca,'YGrid','off','XGrid','on');
axis([0 t(end) -1.1 1.1])
title(['AMI : [' num2str(bits) ']']);

figure;
[t,s] = MLT3(bits,bitrate);
plot(t,s,'LineWidth',3);
set(gca,'YGrid','off','XGrid','on');
axis([0 t(end) -1.1 1.1])
title(['MLT-3 : [' num2str(bits) ']']);














