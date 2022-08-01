function [w1] = problem3_part1(A,v,c)
%[w1] = problem_3_part1(A,v,c)
% First method successively computes the matrix powers and computes for a
% column vector 
k = length(c);
B = eye(length(v));% creates a I matrix
term = c(1)*B; %does the first term of c1v

  % Goes through the length of c, then successively computes the matrix powers
  for i = 2 : k  
    B = A * B;
    term = term + c(i) *B; 
  end

  w1 = term * v; %computes w = Bv
end