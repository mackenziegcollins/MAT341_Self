%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this function plots probabilities for a particular radius vs.radius
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function vary_Radii_Plot()

rVec = [0.01:0.005:0.10  0.1:0.01:0.5];
probVec = []; % initializes probVec as an empty vector

for i = 1:length(rVec) 
    probVec(i) = estimate_Coin_In_Square_Probability(rVec(i),1e5);
    % takes initial function and applies rVec
end

plot(rVec, probVec) % plot probability vs radius
xlabel('radii') % label x axis
ylabel('probability') % label y axis

% for a probability of 0.5 we would have to have the radius approximately 0.15
% for a probability of 0.1 we would have to have the radius approximately 0.35
% for a probability of 0.01 we would have to have a radius approximately 0.45