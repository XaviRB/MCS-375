function [term] = problem3_part3(A, v, c)
%[term] = problem_3_part3(A,v,c)
% Third method reads from right to left by successively computing term A and  
% computes for a column vector

k = length(c);
term = c(end) * v;%calculates first case cv1 going right to left

for i = k - 1 :-1 :1  
    term = A * term + c(i) * v; 
end
end