function [x] = Solves(M,b,inds)
% [x] = Solves(M, b, inds)
% Computes Ax = b using the LU factorization matrix
%
% M is the LU factors of A assume M is invertalbe 
% b is the colomn vector that we test
% inds is the indices that is the size of the matrix
%
% Input: LU matrix M, and a colomn vector b 
% Output: Solution of Ax = b as a colomn vector x 

[r,c] = size(M);
b = b(inds); % swap b row in index
x = b ;
threshold = norm(x) * length (x) * sqrt(eps); % Threshhold that is near singularity 

i = 1;
while abs(x(i)) < threshold % compares xi to the threshhold
    i = i + 1; % skips calculation
end

for j = i : r
    x(j) = x(j) - M(j, i:(j - 1))*x(i:(j - 1));% forward-substitution
end

i = r;
while abs(x(i)) < threshold % compares xi to the threshhold
    i = i - 1; % skips calculation
end

for j = i : -1: 1
    x(j) = (x(j) - M(j, j + 1:c)*x(j + 1:c)) / M(j,j); % backward substitution
end
end
