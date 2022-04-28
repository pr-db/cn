clc;
clear all;
close all;
msg=input('Input Message binary bit stream :');
% msg=[ 1 0 1 1 1 1 1 0 1 1 0 0 1 1 1 1 1 0 0 1 1 1 1 1 0 1 1 0 ];
%umsg=[ 1 0 1 1 1 1 1 % 1 1 0 0 1 1 1 1 1 % 0 1 1 1 1 1 % 1 1 0 ];

umsg =msg;
ct=0;
cts=0;
N=length(msg);
for j=1:N-5-cts
    ct=0;
    for i=j:j+4
        if msg(i)==0
            break;
        else
            ct=ct+1;
        end
    end
    if ct==5
        if msg(i+1)==0
            umsg(i+1-cts) = [];
            cts=cts+1;
            j=i+1;
        end
    end

end
umsg