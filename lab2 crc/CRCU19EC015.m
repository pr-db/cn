clear all;
close all;
clc;

d_w=[1 1 0 1];
div=[1 0 1 0];

%% Transmitter

d_w_length=length(d_w);
div_length=length(div);
remainder=d_w(1:div_length);

for i=(div_length):(d_w_length)
    if (remainder(1) == div(1))
        remainder=bitxor(remainder,div);
    end
    remainder = remainder(2:div_length);
    if (i ~= d_w_length)
        remainder = [remainder d_w(i+1)];
    end
end

c_w= [d_w remainder];
disp('codeword')
disp(c_w);

%% channel noise

c_w=awgn(c_w,10);
disp('codeword with noise')
disp(c_w);
%% reciever preprocess
c_w=round(c_w);
c_w= c_w > 0;
disp('codeword after preprocessing')
disp(c_w);
%% reciever check

c_w_length=length(c_w);
syndrome=c_w(1:div_length);

for i=(div_length):(c_w_length)
    if (syndrome(1) == div(1))
        syndrome=bitxor(syndrome,div);
    end
    syndrome = syndrome(2:div_length);
    if (i ~= c_w_length)
        syndrome = [syndrome c_w(i+1)];
    end
end
disp('syndrome')
disp(syndrome);

for i=1:length(syndrome)
    if(syndrome(i)==1)
        disp('Error is present');
        break;
    elseif (i==length(syndrome))
        disp('Error is not present');
    end
end
