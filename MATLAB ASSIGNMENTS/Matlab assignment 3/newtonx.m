function [ sol, flag ] = newtonx( sx, relerr, maxit, func )
% [SOL,FLAG] = NEWTONX( SX, RELERR, MAXIT, FUNC)
%
% Solves f(x) = 0 using Newton s method
%
% Input: scalar sx - starting point of the iteration
% small positive scalar relerr - desired relative error
% positive integer maxit - maximum no. of iterations permitted
% func: name of the program that defines f(x);
%
% Note: when running newtonx on the problem defined by func, you
% must enter @func (func with symbol @ attached) in the input line.
% The calling sequence for the program func must have the format
% [yval, yder] = func(x)
% where x is the point used to compute yval = f(x) and yder = f-(x).
%   
% Output: scalar sol - solution found
% scalar flag - flag = 0 indicates solution successfully found
% flag = 1 indicates derivative too small; halt
% flag = 2 indicates too many iterations; halt
% etc etc

sol = [ ] ; % default setting: no result
k = 0 ;
while ( k < maxit)
    k = k + 1 ;
    [yval, yder] = func(sx) ; % evaluate f(x) and f (x)
    if ( abs(yder) < abs(yval) * sqrt(eps) ) %check val
        sol = [];
        flag = 1 ; return % Flag if small check
    end
    
                            
    sx = sx - yval / yder ; % take the Newton step
    sx = real(sx);
    display(sx);
    if(abs(yval/yder) < relerr)
       sol = sx; flag = 0; return
    end

    if (abs(func(sx)) < relerr)
        sol = sx; flag = 0; return
    end

end
flag = 2; return % flag fail 
end