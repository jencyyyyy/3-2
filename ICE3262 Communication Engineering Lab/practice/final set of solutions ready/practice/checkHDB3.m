%HBD3
clc;
clear all;
close all;
x=[1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 1 0];
%x=[1 0 0 0 0 1 0  1 1 1 0 0 0 0 1 0 1];
%x=[0 0 0 0 0 1 1 1 0 0 0 0 1 0];
hdb3_code=x;
ami_code=x;
nx=size(x,2);
next_pulse=1;
sign=-1;
B=0;
V=1;
N=0;
i=1;
flag=0;
four_zero=0;
while i<nx+1 
    if x(i)==1
        hdb3_code(i)=next_pulse;       
        next_pulse=next_pulse*-1;
        N=N+1;       
       
    else
        if i<nx-2
            if (x(i+1)==0 && x(i+2)==0 && x(i+3)==0 )                                                              
                        if(rem(N,2)~=0 || flag==0)
                            B=0;
                            V=next_pulse*-1;
                        else
                            B=next_pulse;
                            V=B;
                            next_pulse=next_pulse*-1;
                        end                      
                        hdb3_code(i)=B;
                        hdb3_code(i+3)=V;                      
                        N=0;
                        flag=1;
                        four_zero=1;
                       
             end
        end        
    end
    if four_zero==1
        i=i+4;
        four_zero=0;
    else
        i=i+1;
    end
end

i=1;
while i<nx+1
    t = i:0.001:i+1-0.001;
    if x(i)==1
        unipolar_code=square(t*2*pi,100);
        bipolar_code=sign*square(t*2*pi,100);
        sign=sign*-1;
       
    else
        unipolar_code=0;              
        bipolar_code=0;
       
    end
    subplot(3,1,1);
    plot(t,unipolar_code);
    ylabel('unipolar code');
    hold on;
    grid on;
    axis([1 nx -2 2]);
   
    subplot(3,1,2);
    plot(t,bipolar_code);
    ylabel('bipolar code');
    hold on;
    grid on;
    axis([1 nx -2 2]);
   
    subplot(3,1,3);
    plot(t,hdb3_code(i)*square(t*2*pi,100));
    ylabel('HDB3 code');
    hold on;
    grid on;
    axis([0 nx+1 -2 2]);
    i=i+1;
end