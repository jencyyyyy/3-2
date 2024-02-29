%ML T - 3
signal = [0, 0, 0, 1, 1, 0, 0, 0];
voltage_level = 5;
same_level = voltage_level;
opposite_level = - same_level;

check_nonzero_level=1;
bit_diff = 1;
t = 0:0.01:length(signal) ;
for j =1: length(t)

if t(j ) < bit_diff;
if (signal(bit_diff )==0)
if (check_nonzero_level==1)
signal_MLT(j ) = same_level;
end

if (check_nonzero_level==0)
signal_MLT ( j ) = 0;
end
end
if(signal(bit_diff)==1)

if(check_nonzero_level==1 && j==1)
signal_MLT(j ) = same_level;
elseif (check_nonzero_level==1)
signal_MLT (j ) = 0;
end

if (check_nonzero_level==0)
signal_MLT(j ) = opposite_level;
end
end

else
if (signal (bit_diff )==1)
if (check_nonzero_level==0)
signal_MLT(j ) = opposite_level;

same_level = opposite_level;
opposite_level = -same_level;
check_nonzero_level = 1;
elseif (check_nonzero_level==1)
signal_MLT ( j ) = 0;

check_nonzero_level = 0;
end

end

if(signal(bit_diff )==0)
if (check_nonzero_level==1)
signal_MLT(j ) = same_level;

opposite_level = -same_level;
end
if (check_nonzero_level==0)
signal_MLT( j ) = 0;
check_nonzero_level=0;
end

end
if(bit_diff==length(signal) )
% bit_diff = bit_diff-1;
end
bit_diff = bit_diff + 1;
end
end

%plot
plot (t, signal_MLT, 'r' ) ;
grid on;
axis([0 length (signal) -6 6])
