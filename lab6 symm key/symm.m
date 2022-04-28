clc;
close all;
clear all;
file=fileread('plaintext.txt');
n=length(file);
for i=1:1:n
    encrypt(i)=bitxor(int32(file(i)),i);   %Xoring to encript data
end
encrypted_data=char(encrypt);
display(encrypted_data);
n=length(encrypted_data);
for i=1:1:n
decrypt(i)=bitxor(int32(encrypted_data(i)),i);  %Xoring again to decript data
end
decrypted_data=char(decrypt);
display(decrypted_data);
