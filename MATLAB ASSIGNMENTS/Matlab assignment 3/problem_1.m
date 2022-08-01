function [yval] = problem_1(x)
%[yval] = problem_1(inputArg1,inputArg2)
%   Input: x - point to be evaluated at
%   Output: yval - value at x

c = [1 0 -2 -5];

[yval] = horner2(c,x);

end