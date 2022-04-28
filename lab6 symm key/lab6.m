close all;
clear all;
file=fileread('plaintext.txt');
n=strlength(file);
for i=1:1:n
    encript(i)=bitxor(int32(file(i)),i);   %Xoring to encript data
end
encripted_data=char(encript);
display(encripted_data);
n=strlength(encripted_data);
for i=1:1:n
decript(i)=bitxor(int32(encripted_data(i)),i);  %Xoring again to decript data
end
decripted_data=char(decript);
display(decripted_data);
