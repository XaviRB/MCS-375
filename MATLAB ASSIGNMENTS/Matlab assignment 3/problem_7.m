function [yval] = problem_7(x)
%[yval,yder] = problem_1(inputArg1,inputArg2)
%   Input: x - point to be evaluated at
%   Output: yval - value at x
%           yder - derivative at x

c = [1 0 0 1];

yval = horner2(c,x);
end