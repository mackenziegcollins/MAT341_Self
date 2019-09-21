function plot_Nested_Times()

N= [1:1:10  20:10:100  125 150 175 200 225 250]; % given values for N
x = []; % initialize

for i=1:length(N)
    x(i) = calculate_Nested_For_Loop_Time(N(i)); % uses values from other function
end

loglog(N,x, 'color', 'magenta', 'LineWidth', 5)
xlabel('N')
ylabel('Times')