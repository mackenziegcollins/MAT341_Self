%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% This algorithm implements a linear least squares regression through the
% given function with an mth degree polynomial while outputting the L2 norm
% of the residual vector.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function fit_Sine_Series()

N = 250; % set number of data points
xData = linspace(-pi,pi,N); % data points
yData = ( (0.25*xData.^2).*cos(xData).^4.*sin(xData).^7)'; 
% column vector of y values
M = 40; % set degree of the fit polynomial
A = []; % initialize A matrix

for i = 1:length(xData) 
    % fill in A matrix
    for k = 1:M+1
        A(i,k) = xData(i)^(k-1);
    end
end

bVec = ((A' * A) \ A')*yData % gives psuedo inverse of A and multiplies it 
% by y vector
xReg = []; % initialize regression
for i = 1:length(xData)
    xReg(i,1) = xData(i);
    % calculate polynomial value
    sum = 0;
    for k = 1:M+1
        sum = sum + bVec(k)*xData(i)^(k-1); 
    end
    xReg(i,2) = sum;
   
end 

 rVec = yData - A*bVec; % calculate the residual vector 
 L2_Norm = sqrt(rVec'*rVec) % calculate the L2 Norm of the residual vector
 
 xlabel('x');
 ylabel('y');
 plot(xData, yData, 'o', 'Color', 'blue', 'LineWidth', 6)
 % plots data
 hold on;
 plot(xReg(:,1),xReg(:,2),'red', 'LineWidth', 4)
 % plots polynomial
 legend('Data', 'Best Sine Fit');
 
% a) When M = 5 the L2 norm is 0.1105, when M  = 10 the L2 norm is 0.0750,
% when M = 20 the L2 norm is 0.0173, and when M = 40 the L2 norm is 0.0087.
% The L2 norm got smaller as we increased the value of M.

% b) Fourier Series