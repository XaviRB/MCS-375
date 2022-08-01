function [y] = horner2(c, x)

y = c(1)*ones(size(x));

for i = 2: length(c)
    y = y .* x + c(i);
    
end
end