function A = generateQ(n)

B = [1:n]' * [1:n];

s = -12 / (n * (n+1) * (2*n+1)) ;

A = s * B + eye(n);

end
