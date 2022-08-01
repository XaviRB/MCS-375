function y = polyout(c, x) 
% [Y] = HORNERS(C,X)
%function that grabs a row coefficients c and a vector of values x of any polynomial
%and outputs a vector of values
% y = polyout(c, x) 
% plot(x, polyout(c, x))
     
cl = length(c);

y = zeros(size(x)); % vectors of 0 the size of x

for i = 1: cl
    y = x .* y + c(i); 
end
end