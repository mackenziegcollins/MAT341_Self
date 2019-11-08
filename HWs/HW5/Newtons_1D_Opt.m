%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% This algorithm applies Newton's Method to a one dimensional function to
% work to find the minimum of that function.  It does so by using both the
% first and second derivatives of the function and using some intial guess 
% xn. The algorithm then applies the formula xn1 = xn - f'(xn)/f''(xn).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function N = Newtons_1D_Opt(tol)

xn = 0.25; % initialize xn with given guess
xn1 = 0; % initialize xn1 to 0
err = 1; 
N = 0;

while err > tol
    xn1 = xn - (fp(xn)/fpp(xn)); % Newton's method's algorithm
    err = abs(xn1 - xn); % sets err to apply to each new xn1 and xn
    N = N + 1; % counts N iterations
    xn = xn1; % assigns xn as xn1
end
minimum = f(xn)

function val = f(x) % define function of graph 
val = 0.5 - x*exp(-x^2);

function val = fp(x) % first derivative of the function
val = 2*x^2*exp(-x^2)-exp(-x^2);

function val = fpp(x) % second derivative of the function
val = -4*exp(-x^2)*x^3+6*exp(-x^2)*x;

% a) I found that this code takes 6 iterations to find the minimum.

% b) The code took 736 iterations to try to find the minimum, which it
% couldn't even find.  For the minimum, it output NaN. We see that Newton's
% Method depends heavily on the intial guess. 