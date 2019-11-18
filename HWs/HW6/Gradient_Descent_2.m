%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% This algorithm does the same thing as Gradient_Descent_1, but this time
% implements the Borzlai-Bowein step size.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function N = Gradient_Descent_2(tol)

xn = [1.0; 1.5]; % initial guess
xn1 = [0; 0];
gamma = 0.5; % initial gamma
err = 1;
N = 0;

while err > tol
    
    xn1 = xn - gamma*fgrad(xn); % algorithm given to us
    
    xdiff = (xn1 - xn); % vector of difference between xn1 and xn
    err = sqrt(xdiff'*xdiff); % define L^2-norm error
    
    gdiff = fgrad(xn1) - fgrad(xn); 
    % vector of difference between gradient of xn1 and gradient of xn
    gamma = abs((xdiff'*gdiff)/(gdiff'*gdiff));
    % define Borzlai-Borwein step size
    
    xn = xn1; % now set xn = xn1
   
    N = N + 1; % counts N iterations
    
end

minimum = f(xn)

function val = f(x) % define function 
val = -(sin(x(1)) + cos(x(2)));    

function val = fgrad(x) % define gradient of our function
val = [-cos(x(1)); sin(x(2))];

% a) Using the given initial point it took 6 iterations to achieve 
% 1e-6 accuracy with the Barzilai-Borwein step-size

% b) Using the given initial point it took 7 iterations to achieve 
% 1e-10 accuracy with the Barzilai-Borwein step-size



