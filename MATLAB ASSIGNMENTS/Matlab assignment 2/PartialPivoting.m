function [M, inds, flag] = PartialPivoting(A)
%[M, inds, flag] = PartialPivoting(A)
% Uses partial pivoting to solve A
% that is if A is invertible.
%
% M is the LU factors of A
% inds is the indices that is the size of the matrix
% flag is a boolean that will flag 1 if the matrix is or near singularity 
%
% Input: square matrix A
% Output: square matrix U containing the LU factors of A. 
M = A;
[r,c]=size(M); % row and column 
inds= (1 : r)'; % makes a colomun for inds
flag=0; % flag for singularity or near singularity

n = norm(A,1) * c * sqrt(eps); % grabs the smallest number near singularity 

for k = 1 : (c - 1)

    ind = k + 1 :r;
    [~, maxind] = max(abs(M(k:r, k))); %grabs the max index

        if maxind ~= 1   % partial pivoting
            j = maxind + k - 1;
            M = swapRow(M, k, j); % swaps row
            inds = swapRow(inds,k,j);% swaps inds
        end
    
    M(ind,k) = M(ind,k)/M(k,k);     % compute mutipliers

    for i =ind
        M(i,ind) = M(i,ind) - M(i,k) *M(k,ind);    %row reduction
    end
end

if min(abs(diag(M))) < n % checks the diaginal for singularity if so
    flag = 1;            % flag it
end
end

function [A] = swapRow(A, row1, row2)
% [A] =  swapRow(A, row1, row2)
% Swaps the row 1 for row 2 in a matrix
A([row2, row1], : ) = A ([row1, row2], :);
end