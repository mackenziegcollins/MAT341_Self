%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% This algorithm applies Newton's Method to a two dimensional function to
% work to find the minimum of that function.  It does so by using the 
% Hessian matrix and gradient of the function and using some intial guess.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function N = Newtons_2D_Opt(tol)

err = 1;
xn = [-4.5; 4.5];
N = 0;

while err > tol
    
    H = [sin(xn(1)) 0; 0 cos(xn(2))]; % Hessian matrix of our function
    
    xn1 = xn - H\fgrad(xn); % uses both gradient and Hessian matrix to find xn1
    
    xdiff = abs(xn1 - xn); % creates vector of difference of xn1 and xn
    err = sqrt(xdiff'*xdiff); % applies L2 error
    
    N = N + 1; % counts N iterations
    
    xn = xn1; % assigns xn as xn1
end
minimum = f(xn)

function val = f(x) % define function of graph 
val = -(sin(x(1)) + cos(x(2)));

function val = fgrad(x) % gradient of our function
val = [-cos(x(1)); sin(x(2))];

% a) With the given initial guesses and an error tolerance of 1e-8, it took
% 5 iterations to find the minima of this function.  The minima found was
% -2.

% b) With new initial guesses, it only took 4 iterations to find the minima
% of -2.