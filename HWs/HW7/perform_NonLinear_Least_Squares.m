%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This algorithm performs nonlinear least squares regression on data and
% then plots the data and regression on same plot for comparison.  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function perform_NonLinear_Least_Squares()

N = 2500; % amount of data points
tol = 1e-5; % set tolerance
err = 1; % initialize error

data = give_NonLinear_Least_Squares_Data(N); % takes data from other script
xData = data(:,1);
yData = data(:,2);

bVec = [1 0.5 0.3]'; % set beta vector
while err > tol
    J = []; % initialize Jacobian matrix
    for i = 1:N
        expVal = exp((-(xData(i)-bVec(2))^2)/(2*bVec(3)^2));
        % create Jacobian rows    
        J(i,1) = expVal;
        J(i,2) = bVec(1)*((xData(i) - bVec(2))/(bVec(3)^2))*expVal;
        J(i,3) = bVec(1)*((xData(i) - bVec(2))^2/(bVec(3)^3))*expVal; 
    end
    
    rVec = []; % initialize residual vector
    for i = 1:N
        expVal = exp((-(xData(i)-bVec(2))^2)/(2*bVec(3)^2));
        rVec(i) = yData(i) - bVec(1)*expVal;
    end

    pseudoInv = inv(J' * J)*J';
    % calculate the new beta vector
    bNewVec = bVec + pseudoInv*rVec';
    % L2 norm for error tolerance
    err = sqrt((bNewVec - bVec)' * (bNewVec - bVec));
    % set beta vector to new beta vector
    bVec = bNewVec;
end

err

regData = []; % initialize the vector for the regression data
for i = 1:N
    expVal = exp(-(xData(i) - bVec(2))^2/(2*bVec(3)^2));
    regData(i) = bVec(1)*expVal;
end

figure;
plot(xData, yData, 'k.', 'Color', 'blue', 'MarkerSize', 20);
% prints data
hold on
plot(xData, regData, 'Color', 'red', 'LineWidth', 4);
% prints polynomial
xlabel('x');
ylabel('y');
legend('Data', 'Model Fit');
