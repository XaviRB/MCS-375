function [Ainv] = Inverse(A)
%[Ainv] = Inverse(A)
% Uses the matrix A and finds the inverse 
% using the LU factorization of A.
% A is a n x n matix
% Input: matrix A
% Output: Inverse of LU = A
[r,c] = size(A);
Ainv = eye(r, c); % creates a blank matrix of zeros 
[m, ind] = PartialPivoting(A); %calls my PartialPivoting

for k = 1: r
    Ainv(:,k) = Solves(m, Ainv(:, k), ind); %computes the x 
end
end
