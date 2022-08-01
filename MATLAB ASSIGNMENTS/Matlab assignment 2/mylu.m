function [ m,x ] = mylu
% [M,X] = MYLU(A,B)
%
% Computes LU factors of A without pivoting
% assuming that A is invertible and well-conditioned,
% and uses the factors to solve Ax = b.
%
% This program uses row oriented matrix access
%
% Input: square matrix A, column vector b.
%
% Output: square matrix M containing LU factors of A ;
% column vector x: the solution of Ax=b.

a = [1 2; 0 4]; 
b = [1 2]';
m = a ; 
x = b ;
[r,c] = size(m) ;

for k = 1 : (c-1)
    
    ind = k+1 : r ;
    m(ind,k) = m(ind,k) / m(k,k) ; % compute multipliers

    for i = ind
        m(i,ind) = m(i,ind) - m(i,k) * m(k,ind) ; % row reduction
    end
end

for i = 2 : r
    x(i) = x(i) - m(i,1:(i-1)) * x(1:(i-1)) ; % forward-substitution
end

x(r) = x(r) / m(r,r) ;

for i = (r-1) : -1 : 1
    x(i) = ( x(i) - m(i,i+1 : c) * x( i+1 : c ) ) / m(i,i) ; % back-substitution
end
end