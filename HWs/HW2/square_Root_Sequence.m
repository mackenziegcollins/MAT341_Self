function val = square_Root_Sequence(m,n)

val = sqrt(m); % initialize value 

for i = 2:n 
    
    if mod(n,2) == 0 
        sign = (-1)^(1+n) % chooses sign
    else 
        sign = (-1)^n % chooses sign
    end
    
    val = sqrt(m +((-1)^i)*sign*val) % applies formula
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for m = 13 the limit appears to be 3
% for m = 31 the limit appears to be 5
% for m = 43 the limit appears to be 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%