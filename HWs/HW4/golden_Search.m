%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script writes a function that inputs a tolerance and outputs number of
% iterations to find the minimum of a function on the closed interval [0,2]
% while implementing the golden search algorithm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = golden_Search(tol)
a = 0; % left end point of given interval
b = 2; % right end point of given interval

T = (sqrt(5)-1)/2; % search step
x1 = a + (1-T)*(b-a); % defines x1
x2 = a + T*(b-a); % defines x2
f1 = f(x1); % inputs x1 into the function f defined below
f2 = f(x2); % inputs x2 into the function f defined below
N = 0; % initialize N to zero

while (b-a) > tol  
    if f1 > f2
        a = x1; % redefine a
        x1 = x2; % now x1 is defined as x2
        f1 = f2; % redfine f1
        x2 = a + T*(b-a); % x2 is redefined with new a value
        f2 = f(x2); % f(x2) recalculated with new x2
    else
        b = x2; % redefine b
        x2 = x1; % redefine x2
        f2 = f1; % redefine f2
        x1 = a + (1-T)*(b-a); % x2 is recalulated with new b value
        f1 = f(x1); % f(x1) recaluled with new x1
    end
    N=N+1; % adds 1 to N to count the number of iterations performed
end

minimum = f(x1) % prints the minimum!

function val = f(x) % define function of graph 
val = 0.5 - x*exp(-x^2);

% a) I found that it takes 40 iterations to achieve 1e-8 accuracy
% the minimum is 0.0711