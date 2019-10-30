%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% This script calls on the algorithms golden_Search and
% successive_Parabolic_Interpolation, runs them for several different error
% tolerances, and plots the tolerance number versus the number of
% iterations needed to find the minimum using both loglog and semilog.
% Input/output nothing and displays the two comparative graphs.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_Error_Tolerances_To_Compare()

errTolVec = [1e-1  1e-2  1e-3  1e-4  1e-5  1e-6  1e-7  1e-8  1e-9  1e-10  1e-11  1e-12]
% given vector of different tolerance values to test
goldenVec = [] 
% creates empty vector to test golden_Search script
parabolicVec = [] 
% creates empty vector to test successive_Parabolic_Interpolation script

for i = 1:length(errTolVec) 
    goldenVec(i) = golden_Search(errTolVec(i)); 
    parabolicVec(i) = successive_Parabolic_Interpolation(errTolVec(i));
    % tests the different error tolerances from errTolVec in the two
    % different scripts we have
end

figure(1); % creates one graph using semilog
semilogx(errTolVec, goldenVec, 'color', 'blue', 'LineWidth',5)
% graphs error versus goldenVec iterations with blue line in size 5
hold on % hold on command is used to plot two different lines on one figure
semilogx(errTolVec, parabolicVec, 'color', 'red', 'LineWidth', 5)
% graphs error versus parabolicVec iterations with red line in size 5
xlabel('Error Tolerance') % x axis label
ylabel('N iterations') % y axis label
legend('Golden Search', 'Succ. Para. Interp.') 
% adds legend to graph to tell which line is which at a glance

figure(2); % creates a second graph in same way using loglog
loglog(errTolVec, goldenVec, 'color', 'blue', 'LineWidth',5)
hold on 
loglog(errTolVec, parabolicVec, 'color', 'red', 'LineWidth', 5)
xlabel('Error Tolerance')
ylabel('N iterations')
legend('Golden Search', 'Succ. Para. Interp.')

% a) From the graphs, it appears that the successive parabolic
% interpolation script generally finds the minimum faster (with
% less iterations) when using a low tolerance than the other script does.
% b) As the accuracy threshold is increased, we see that the successive
% parabolic interpolation converges at a much different pace.  We see it
% suddenly needs many more iterations to find the minimum.  This occurs
% around 1e-8.  Then, it requires about the same amount as the golden
% search one.  I speculate that this occurs because of the because as the
% tolerance is increased, it gets harder and harder to get the most
% accurate minimum, but works very effeciently for low tolerance levels.