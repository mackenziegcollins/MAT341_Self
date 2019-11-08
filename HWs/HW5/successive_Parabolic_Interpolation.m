% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script takes input of a tolerance and outputs the number of
% iterations needed to find the minimum of a given equation.  This script
% takes three defined intial points and implement the successive parabolic
% interpolation algorithm. With each iteration the script replaces the 
% worst point with the extremum of the fitted parabola.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function N = successive_Parabolic_Interpolation(tol)

a = 0; % left end point of given interval
b = 2; % right end point of given interval
x1 =0; 
x2 = 0.6;
x3 = 0.9;
N=0;

while abs(x3-x1) > tol 
    A = [x1^2 x1 1; x2^2 x2 1; x3^2 x3 1]; % matrix for values
    b = [f(x1); f(x2); f(x3)]; % vector of each point put in the function
    x = A\b; % inverse of A times b

    vertex = -x(2)/(2*x(1)); % formula to find vertex of parabola
    x3 = x2; % redefines x3
    x2 = x1; % redefines x2
    x1 = vertex; % defines x1 as the vertex
    N = N + 1; % adds 1 to N to count the number of iterations performed
end

minimum = f(x1) % prints minimum

function val = f(x) % define function of graph 
val = 0.5 - x*exp(-x^2);

% a) I found that it takes 7 iterations to achieve 1e-8 accuracy
% b) Initial value x3 = 2, the number of iterations needed find the minimum
% is now 11.  MATLAB issued a warning that my matrix is close to singular
% or badly scaled. This must indicate that the matrix has a determinant so
% small and close to the number 0, that MATLAB may be interpretting it as
% 0.