function A = generateD(n)
% Creates an n by n matrix Dn, whose entries satisfy d(I,j)=i^1 and b(i)=1. 
% input= A scalar 
% output= A matrix based on n

A= zeros(n) ;
s = (1:n)'; 

sP = ones(1,n)' ;  
for i = 1 : n  
    sP = sP .* s ;  % generates through each column of the new matrix
    A(:,i) = sP ;   % takes each new column value by multiplying it by its corresponding 1:n multiple
end
