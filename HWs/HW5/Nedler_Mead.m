%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code implements the Nedler Mead algorithm to find the minimum of a
% given function. This algorithm uses three points of a triangle and works
% to find the 'best' point ie the minima.  This is done so by creating a
% midpoint vector and a reach vector to determine better and better points.
% The function has an input of a certain tolerance and outputs the number
% of iterations necessary to find the minimum.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function N = Nedler_Mead(tol)

X = [0.35 2.8; 4 4; 4.5 4.5];
% these are the 3 given points of our triangle in a 3x2 matrix
err = 1;
N = 0;
% Initialize both N and error

while err > tol
    inds = []; 
    vals = [f(X(1,:)) f(X(2,:)) f(X(3,:))]; 
    % sets these values as each row of the matrix X put into the given
    % function
    [sortedVals, inds] = sort(vals); 
    % sorts values
    
    xmVec = (1/2)*(X(inds(1),:) + X(inds(2),:)); 
    % vector that finds midpoint of x1 and x2 (first 2 rows of matrix X)
    xrVec = xmVec +(xmVec - X(inds(3),:)); 
    % the 'reach vector' reaches into middle of triangle 
    
    % transformation step
    if f(xrVec) < sortedVals(3) % if we have found a point less than x3
        X(inds(3),:) = xrVec; % set a new x3 for a better/smaller triangle
    elseif f(xrVec)>= sortedVals(3) % if we found a worse xr
        xcVec = (1/2)*(xmVec + X(inds(3),:)); % midpoint of midpoint vector and x3
        if f(xcVec) < sortedVals(3) % if we found better vector than x3
            X(inds(3),:) = xcVec; % set equal
        else 
            % shrink triangle in direction of x1Vec 
            xm2Vec = (1/2)*(X(inds(1),:) + X(inds(3),:)); 
            % create second midpoint vector
            x(1,:) = X(inds(1),:);
            x(2,:) = xmVec;
            X(3,:) = xm2Vec; 
        end
    end
    err = abs(f(X(inds(1),:))-f(X(inds(3),:)));
    % define error as |f(x1vec) - f(x3vec)| where x1vec is smallest point
    % and x3vec is biggest we currently have
    N = N + 1;
    % count N iterations
end
min = sortedVals(1) % outputs minimum so we know we're getting good numbers

function val = f(x)
val = -(sin(x(1))+cos(x(2))); % function of which we want to find min

% the minimum is found to be -2

% a) It takes 29 iterations to achieve 1e-8 accuracy

% b) It appears that the point is converging to the point -2 because the
% minimum my code found was -1.99999946224219y which is very close to -2, 
% the actual minima. This does not look like 1e-8 error because there are 
% only six 9s in the decimal places, where we expect eight 9s. 

% c) When changing our x2 value to (1.75, 0.1) we see that it takes 58
% iterations to achieve 1e-8 accuracy.  The minima found is
% -1.999999992153997.  We see the number of iterations has doubled to find
% this minima and was able to get an even more accurate minima. With an
% increase in number of iterations and an x2 value now even closer to the
% actual minima, we are able to get a very close approximation to the
% actual minimum.

% d) When changing my x2 and x3 points, the minima found was
% -1.999999970855956 after 119 iterations.
