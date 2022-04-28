clc;
clear all;

p=13;
q=19;

n=p*q;
phi=(p-1)*(q-1);
e=13;

d=1;
while(mod(e*d,phi)~=1)
    d=d+1;
end

%fprintf('p -> %d\nq -> %d\nn -> %d\nphi -> %d\ne -> %d\nd -> %d\n',p,q,n,phi,e,d);

fprintf('n -> %d\ne -> %d\n',n,e);
P='Communication Lab';
fprintf('Plain text ->  %s \n',P);
int_P=double(P);

%fprintf('Plain text in interger -> ');
%disp(int_P);
%C=mod(power(int_P,e),n);

C=powermod(int_P,e,n);
char_c=char(C);
fprintf('Cipher text -> ');
disp(char_c);

%rec_P=mod(power(C,d),n);

rec_P=powermod(C,d,n);

%fprintf('decoded text in integer-> ');
%disp(rec_P);

%if rec_P==int_P
%    disp("Both received and send message are same");
%end

rec_s_P=char(rec_P);
fprintf('Decoded received text -> ');
disp(rec_s_P);