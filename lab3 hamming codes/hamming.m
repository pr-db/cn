clc;
close all;
clear all;

% message bits
m = [0 1 0 1];
n = length(m);
r = 1;

while (power(2,r) < (n+r+1))
    r = r+1;
end


% Final result array
res = zeros(1, n+r);

% Find positions of redundant bits
for i = 0:1:r-1
    res(power(2, i)) = -1;
end

j=1;

for i=1:1:r+n-1
    if(res(i) ~= -1)
        res(i) = m(j);
        j = j+1;
    end
end

for i=1:1:r+n-1
    if(res(i) == -1)
        x = log2(i);
        ones = 0;

        for j=i+2:1:r+n-1
            if(j && bitsll(1, x))
                if(res(j-1)==1)
                    ones = ones+1;
                end
            end
        end

        if(mod(ones,2)==0)
            res(i) = 0;
        else
            res(i) = 1;
        end
    end
end

disp(res);
