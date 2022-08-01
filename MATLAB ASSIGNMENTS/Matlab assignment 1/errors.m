function  [abs_err , rel_err] = errors(k ,n)
%[abs_err, rel_err] = errors(k, n)
%plot(1:n, x)
%plot(1:n y)

v = 1 : n % vector to n 

a = v .^ (k + 1) / (k + 1)% aprox

vpk = cumsum(v .^ k) %vector to the power of k cumalative sum

abs_err = abs(vpk - a);
rel_err = abs_err ./ vpk;

end