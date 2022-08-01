function [yval] = problem_5(x)
%[yval,yder] = problem_1(inputArg1,inputArg2)
%   Input: x - point to be evaluated at
%   Output: yval - value at x
c = [6 3];

yval = horner2(c,x);
end