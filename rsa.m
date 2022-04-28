close all;
text = 'This is communication networks practical';
p = 61;
q = 53;
n = p*q;
phi = lcm((p-1),(q-1));
e=7;
d=1;
while 1
    if mod(e*d, phi) ==1
        break
    end
    d=d+1;
end
text = double(text);
encrypt=mod(power(text,e),n);
encrypted_data = char(encrypt);
display(encrypted_data);
t=double(encrypted_data);
decrypt=mod(power(t,d),n);
decrypted_data=char(decrypt);
display(decrypted_data);
