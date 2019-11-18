%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This algorithm tests various gamma step size values and then applies them
% into the previous Gradient_Descent_1 algorithm.  It then graphs N
% iterations versus the different gamma values so one can observe what the
% best gamma value approximately is.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_StepSize_Gamma_To_Optimize()

tol = 0.02; % set tolerance with given value
gammaVec = 0.1:0.1:1.9;
% vector of gamma values from 0.01 to 3 with step size of 0.01
NVec = [];

for i = 1:length(gammaVec)
    
    NVec(i)= Gradient_Descent_1(0.02,gammaVec(i));
    % applies Gradient_Descent_1 algorithm with 0.02 tolerance and gammas
    % from the above vector and stores the output of N in NVec 
    
end

semilogx(gammaVec, NVec, 'color', 'blue', 'LineWidth',5);
xlabel('Gamma Values'); % x axis label
ylabel('N iterations'); % y axis label
legend('Fixed Step'); % adds legend


% a) The best gamma for this particular function appears to be 
% approximately 1.

