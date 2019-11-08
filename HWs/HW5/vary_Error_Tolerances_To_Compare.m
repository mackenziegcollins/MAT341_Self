%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% This script calls on the algorithms golden_Search, Newton's Method for 1D
% operations, and successive_Parabolic_Interpolation, runs them for several
% different error tolerances, and plots the tolerance number versus the 
% number of iterations needed to find the minimum using both loglog and
% semilog. Input/output nothing and displays the two comparative graphs.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_Error_Tolerances_To_Compare()

errTolVec = [1e-1  1e-2  1e-3  1e-4  1e-5  1e-6  1e-7  1e-8  1e-9  1e-10  1e-11  1e-12]
% given vector of different tolerance values to test
goldenVec = [] 
% creates empty vector to test golden_Search script
parabolicVec = [] 
% creates empty vector to test successive_Parabolic_Interpolation script
newtonsVec = []
% creates empty vector to test Newtons_1D_Opt

for i = 1:length(errTolVec) 
    goldenVec(i) = golden_Search(errTolVec(i)); 
    parabolicVec(i) = successive_Parabolic_Interpolation(errTolVec(i));
    newtonVec(i) = Newtons_1D_Opt(errTolVec(i));
    % tests the different error tolerances from errTolVec in the three
    % different scripts we have
end

figure(1); % creates one graph using semilog
semilogx(errTolVec, goldenVec, 'color', 'blue', 'LineWidth',5)
% graphs error versus goldenVec iterations with blue line in size 5
hold on % hold on command is used to plot two different lines on one figure
semilogx(errTolVec, parabolicVec, 'color', 'red', 'LineWidth', 5)
% graphs error versus parabolicVec iterations with red line in size 5
hold on
semilogx(errTolVec, newtonVec, 'color', 'black', 'LineWidth', 5)
% graphs error versus newtonsVec iterations with black line of size 5
xlabel('Error Tolerance') % x axis label
ylabel('N iterations') % y axis label
legend('Golden Search', 'Succ. Para. Interp.', 'Newton Method') 
% adds legend to graph to tell which line is which at a glance

figure(2); % creates a second graph in same way using loglog
loglog(errTolVec, goldenVec, 'color', 'blue', 'LineWidth',5)
hold on 
loglog(errTolVec, parabolicVec, 'color', 'red', 'LineWidth', 5)
hold on
loglog(errTolVec, newtonVec, 'color', 'black', 'LineWidth', 5)
xlabel('Error Tolerance')
ylabel('N iterations')
legend('Golden Search', 'Succ. Para. Interp.', 'Newon Method')

% a) It appears that the Successive Parabolic Interpolation algorithm
% converges faster to the minimum for less accurate tolerances.

% b) Once the accuracy threshold increases, we see that now the Newton's 
% Method algorithm converges more quickly than the Successive Parabolic 
% Interpolation algorithm.  

% c) Each of the three algorithms depend on the initial guesses.  
% The amount of iterations depended on how close the intial guesses were to
% the actual minimum.  