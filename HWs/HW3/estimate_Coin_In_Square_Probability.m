%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  This function calculates the probability of a coin landing 
%  perfectly within a square
%
%  To approach this problem, I looked to somehow create a random vector
%  to represent the coin landing somewhere, and then create restrictions 
%  to see where it lands in relation to the sqaure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function prob = estimate_Coin_In_Square_Probability(r,N)
%N = 1e5;
%r = 0.1;
count = 0; % initialize count 
for i = 1:N
    xVec = rand(1,2); % random vector with x and y coordinates from 0, 1
    if xVec(1) + r < 1 && xVec(2) + r < 1 && xVec(2) - r > 0 && xVec(1) - r > 0 
    % checks for each edge of the square 
        count = count + 1;
        % if coin lands within square, it adds to the total count
    end
end
prob = count / N; % calculates probability

% using N = 1e5, the estimated probability is 0.64
% using other values of N got similar answers, so N = 1e5 seems appropriate
% using a higher value of N took longer for the system to figure out