function [term] = problem3_part2(A, v, c)
%[term] = problem_3_part2(A,v,c) 
% Second method reads from left to right by successively computing Av and 
% computes for a column vector 

k = length(c);
term = c(1)* v ; %calculates first case cv1
Av = A * v; %computes A by v'

for i = 2 : k 
    term = term + c(i) * Av;
    Av = A * Av;
end
end