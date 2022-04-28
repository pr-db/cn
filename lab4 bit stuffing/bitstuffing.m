clc;
clear all;
close all;

%msg=[ 1 0 1 1 1 1 1 1 1 0 0 1 1 1 1 1 0 1 1 1 1 1 1 1 0 ]      %Unstuffed
%msg=[ 1 0 1 1 1 1 1 0 1 1 0 0 1 1 1 1 1 0 1 1 1 1 1 0 1 1 0]   %Stuffed

msg=input('Input Message binary bit stream :');
count=0;
stuffcount=0;
[M, N]=size(msg);
for j=1:N-5+stuffcount
    j;
    for i=j:j+5
        i;
        if msg(i)==1
            count=count+1;
        else
            count=0;
            break;
        end
    end
        if(count ==6)
            msg=[msg(1:j+4) 0 msg(j+5 : end)];
            count=0;
            stuffcount=stuffcount+1;
        end
end
msg