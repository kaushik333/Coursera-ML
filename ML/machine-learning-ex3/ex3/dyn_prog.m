clc;
clear;
close;

val = [16;19;23;28];
wgt = [2;3;4;5];
cap = 7;
num_items = size(val,1);
%%% Create the table for DP
K = 0:cap;
C = 0:num_items;
table = zeros(cap+1, num_items+1);
size(table)
for i=1:cap+1 
    for j=1:num_items+1 
        if (j-1==0) || (i-1==0)
            table(i,j) = 0;
        else            
            if wgt(j-1)<=K(i)
                table(i,j)= max(val(j-1)+table(i-wgt(j-1), j-1), table(i,j-1));
            else
                table(i,j) = table(i,j-1);
            end
        end        
    end    
end