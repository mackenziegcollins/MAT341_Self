%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script calls on Gradient_Descent_1 and Gradient_Descent_2 and runs
% them for various error tolerances.  It then compares graphically which 
% of the two algorithms find the minimum of the given function faster 
% (with less N iterations).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function vary_Error_Tolerances_To_Compare()

errTolVec = [1e-1  1e-2  1e-3  1e-4  1e-5  1e-6  1e-7  1e-8  1e-9  1e-10  1e-11];
% given vector of different tolerance values to test
grad1Vec = []
grad2Vec = []
% creates empty vectors to test Gradient_Descent_1 and Gradient_Descent_2
% scripts

for i = 1:length(errTolVec) 
    grad1Vec(i) = Gradient_Descent_1(errTolVec(i), 0.5);
    grad2Vec(i) = Gradient_Descent_2(errTolVec(i));
    % creates vectors of output N iterations using different given error
    % tolerance
end 

figure(1); % creates one graph using semilog
semilogx(errTolVec, grad1Vec, 'color', 'blue', 'LineWidth',5);
% graphs error versus Gradient_Descent_1 iterations with blue line in size 5
hold on % hold on command is used to plot two different lines on one figure
semilogx(errTolVec, grad2Vec, 'color', 'red', 'LineWidth', 5);
% graphs error versus Gradient_Descent_2 iterations with red line in size 5
xlabel('Error Tolerance'); % x axis label
ylabel('N iterations'); % y axis label
legend('Fixed Step','Barzilai-Borwein');
% adds legend to graph to tell which line is which at a glance

figure(2); % creates a second graph in same way using loglog
loglog(errTolVec, grad1Vec, 'color', 'blue', 'LineWidth',5);
hold on
loglog(errTolVec, grad2Vec, 'color', 'red', 'LineWidth', 5);
xlabel('Error Tolerance');
ylabel('N iterations');
legend('Fixed Step','Barzilai-Borwein');

% a) It appears as though the fixed step algorithm converges faster to the
% minimum.

% b) When changing the gamma fixed step to 0.5, it appears that the
% Barzilai-Borwein algorithm now converges faster to the minimum.

% c) The fixed step size is only the better option when you know what the
% best step size is.  It is somewhat difficult to find what the best step
% size option is, having to test out many options to find the best one.
% The Barzilai-Borwein step is a good go to.

% d) I would use the Barzilai-Borwein step size because with a different
% function I would not know the best step size to use, which could greatly
% impact the number of iterations.

