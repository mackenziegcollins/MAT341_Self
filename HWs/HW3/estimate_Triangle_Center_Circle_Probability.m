%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  This function takes three random points on the perimeter of a circle
%  and makes a triangle of them
%  It then estimates the probability of the center of the circle being 
%  within the triangle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function prob = estimate_Triangle_Center_Circle_Probability(N)

count = 0; % initialize count to zero

for i = 1:N
    thetaVec = 2*pi*rand(1,3); % creates a vector theta that randomly chooses an angle between 0 and 2pi
    x1Vec = [2*cos(thetaVec(1)) 2*sin(thetaVec(1))]; % creates random points x1, y1
    x2Vec = [2*cos(thetaVec(2)) 2*sin(thetaVec(2))]; % creates random points x2, y2
    x3Vec = [2*cos(thetaVec(3)) 2*sin(thetaVec(3))];% creates random points x3, y3
    
    mVec = [ ((x1Vec(2) - x2Vec(2)) / (x1Vec(1) - x2Vec(1))) ((x1Vec(2) - x3Vec(2)) / (x1Vec(1) - x3Vec(1))) ((x2Vec(2) - x3Vec(2)) / (x2Vec(1) - x3Vec(1)))];
    % mVec using the slope formula to find out the slopes of each of the three lines of the triangle
    bVec = [x1Vec(2)-mVec(1)*x1Vec(1) x2Vec(2)-mVec(2)*x2Vec(1) x3Vec(2)-mVec(3)*x3Vec(1)];
    % bVec finds the y intercept of the lines of the triangle 
    for j = 1:2
        if abs(bVec(j)) <= 2 && abs(bVec(j+1)) <= 2 % makes sure that the y intercept is within the circle
            if bVec(j)*bVec(j+1) < 0 
    % after examining graphically, we see that one line must intersect above origin and one below to contain origin
    % thus we test to see when the two numbers multiply to a negative #
                count = count + 1; % continues to add to the count when the triangle contains the origin
                break;
            end
        end
    end
end

prob = count / N % calculates probability 


% the probability is approximately 0.12
