function calculate_Pi_Sums()

tol = 1e-6; % set error tolerance
err = 1; % initialize error
sumAn = 0; % initialize sum 
sumBn = 0; % initialize sum
Na = -1; % initialized to -1 so when in while loop gives N=0
Nb = -1; % initialized to -1 so when in while loop gives N=0

while err > tol
    
    Na = Na + 1; % bump up partial sum order by 1
    
    sumAn = sumAn + (6/sqrt(3))*((-1)^Na)/(3^Na*(2*Na+1)); % find our approximation
    
    err = abs(sumAn-pi); % calculate the error
end

while err>tol
    
    Nb = Nb + 1; % bump up partial sum order by 1
    
    sumBn = sumBn + 16*((-1)^Nb/(5^(2*Nb+1)*(2*Nb+1))) - 4*((-1)^Nb/(239^(2*Nb+1)*(2*Nb+1))); % find our approximation
    
    err = abs(sumBn-pi); % calculate the error
end
% print Na
Na
% print Nb
Nb