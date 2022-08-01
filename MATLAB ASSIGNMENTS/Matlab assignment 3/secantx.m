function [sol,flag] = secantx(x0, relerr, maxit, func)
%[sol,flag] = secantx(x0, relerr, maxit, func)
% Solves f(x) = 0 using Secant method
%
%Input: scalar x0 - starting point of the iteration
%        positive integer maxit - maximum number of iteraions permitted
%        func: name of the program that defines f(x);
%        Note: when running the problem defined by func, you
%        must enter @func in the input line.
%        The calling sequence for the program func must have the format
% Output: scalar sol - solution found
%         scalar flag - flag = 0 inditcates solution succesfully found
%                       flag = 1 indicates too many iterations; halt

%compute & store yval of starting point and calculating 
delta = sqrt(eps); %stores machine eps
x1  = x0 + sqrt(eps)*abs(x0); % x + h = x1 
fa = func(x0);

for i = 0: maxit

    fb = func(x1); %x1 evalulation per iteration
    step = (fb * (x1 -x0)/(fb - fa)); %secant formula 
    xnew  = x1 - step;

    if abs(step) < max([relerr * abs(xnew), delta])%termination condition checks if error < relerr
        sol = xnew; flag = 0; return
    end
    %swaps and stores the varibles
    x0 = x1; 
    x1 = xnew; 
    fa = fb;
    %solution or flag if to many itertations
    sol = xnew ; flag = 1;
end
