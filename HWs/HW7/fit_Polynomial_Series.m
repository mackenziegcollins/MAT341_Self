%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This algorithm takes the function cos(x) and fits a 12th degree
% polynomial through N data points. The algorithm then outputs the L2 Norm
% of the residual vector.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function fit_Polynomial_Series()

N = 250; % set number of data points
xData = linspace(-2*pi,2*pi,N); % data points
yData = cos(xData)'; % cosine function 
A = []; % initialize A matrix

for i = 1:length(xData) 
    % fill in A matrix
    for k = 1:13 
        A(i,k) = xData(i)^(k-1);
    end
end

bVec = ((A' * A) \ A')*yData 
% gives psuedo inverse of A and multiplies it by y vector
xReg = []; 
% initialize regression

for i = 1:length(xData)
    xReg(i,1) = xData(i);
    % calculate polynomial value
    sum = 0; % initialize sum
    for k = 1:13
        sum = sum + bVec(k)*xData(i)^(k-1); % calculates polynomial val
    end
    xReg(i,2) = sum;  
end 

 rVec = yData - A*bVec; % create residual vector
 L2_Norm = sqrt(rVec'*rVec) % calculate the L2 Norm of the residual vector
 
 figure
 plot(xData, yData, 'o', 'Color', 'blue', 'LineWidth', 6);
 % plots data points
 hold on; 
 plot(xReg(:,1),xReg(:,2),'red', 'LineWidth', 4);
 % plots polynomial
 xlabel('x');
 ylabel('y');
 legend('Data', 'Best Poly Fit');
 
 % a) At N = 10, the L2 Norm is 1.5182e-11, for N = 50 the L2 Norm is 
 % 5.1501e-04, and for N = 250 the L2 Norm is 0.0011. We see that
 % increasing the number of data points increases the L2 Norm. 
 
 % b) We see this is the Taylor Polynomial with the coefficients 
 % +- 1/(2n!)
 
 % c) The coefficients found were 
 %   0.9999
 %   0.0000
 %  -0.4998
 %  -0.0000
 %   0.0416
 %   0.0000
 %  -0.0014
 %  -0.0000
 %   0.0000
 %   0.0000
 %  -0.0000
 %  -0.0000
 %   0.0000
 
 % d) Every odd coefficient is 0, which is expected from the Taylor
 % Expansion.  