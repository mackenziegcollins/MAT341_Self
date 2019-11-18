%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Gradient Descent algorithm! Gamma is step size, we caluculate gradient 
% of f at each iteration, move along gradient by step size, use equation.
% Takes input of both tolerance and gamma step size and outputs the number
% of iterations needed to find the minimum.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = Gradient_Descent_1(tol,gamma)

xn = [1.0; 1.5]; % initial guess
xn1 = [0; 0]; 
err = 1;
N = 0;

while err > tol
    
    xn1 = xn - gamma*fgrad(xn); % algorithm given to us 
    
    xdiff = (xn1 - xn); % vector of difference between xn1 and xn
    err = sqrt(xdiff'*xdiff); % define L^2-norm error
    
    xn = xn1; % now set xn = xn1
   
    N = N + 1; % counts N iterations
    
end

minimum = f(xn)

function val = f(x) % define function 
val = -(sin(x(1)) + cos(x(2)));    

function val = fgrad(x) % define gradient of our function
val = [-cos(x(1)); sin(x(2))];

% a) It takes 35 iterations to find the minimum with gamma = 0.5 and
% tolerance of 1e-10.

% b) It takes 12 iterations to find the minimum with gamma = 0.9 and
% tolerance of 1e-10.

% c) It takes 34 iterations to find the minimum with gamma = 1.5 and
% tolerance of 1e-10.
    