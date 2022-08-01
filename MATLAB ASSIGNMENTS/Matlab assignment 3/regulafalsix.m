function [sol,flag] = regulafalsix(a, b, relerr, maxit, func)
%[sol,flag] = regulafalsix(a, b, relerr, maxit, func)
% Solves f(x) = 0 using Regula Falsi method
%
% Input: scalar a - starting bound of the bracket
% scalar b - ending bound of the bracket 
% small positive scalar relerr - desired relative error
% positive integer maxit - maximum no. of iterations permitted
%        func: name of the program that defines f(x);
%        Note: when running the problem defined by func, you
%        must enter @func in the input line.
%        The calling sequence for the program func must have the format
%
% Output: scalar sol - solution found
%   scalar flag - flag = 0 indicates solution successfully found
%   flag = 1 indicates too many iterations; halt

%compute & store yval of starting bounds
fa = func(a);
fb = func(b);
delta = sqrt(eps); %stores machine eps

k = 0;
while (k < maxit)

    k = k + 1;
    step = (fa / ((fb - fa)/(b-a))); %regulafalsi formula 
    x = a - step; %calculate my new step
    fx = func(x); % evlaulates my new fb

    % checks if signs are the same for fa to fx then swap a else swap b
    if (sign(fx) == sign(fa))
        approx = fa; %stores varibles and swaps 
        a = x; %swap bound a
        fa = fx; %update fa
    else
        approx = fb;
        b = x; %swap bound b
        fb = fx; %update fb
    end

    %termination condition checks if the error < relerr
    if abs(x - approx) < max([relerr * abs(x), delta])
        sol = x; flag = 0; return %returns ans
    end
end
    sol = x; flag = 1; %halt to many iterations 
end