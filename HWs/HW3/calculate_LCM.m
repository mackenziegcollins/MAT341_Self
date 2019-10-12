%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  This function calculates the least common multiple of two integers
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function lcm_val = calculate_LCM(x,y)

gcd = calculate_GCD(x, y); % takes GCD from other function
lcm_val = (x * y) / gcd; % formula to find LCM

function gcd_val = calculate_GCD(x, y) % function to find GCD of x and y

divXVec = calculate_Div(x); % find divisors for inputted x
divYVec = calculate_Div(y); % find divisors for inputted y

%looping backwards will guarantee that the first common divisor found will be GCD
for i=length(divXVec):-1:1 % goes through length of x vector
    for j=length(divYVec):-1:1 % goes through length of y vector
        if divXVec(i) == divYVec(j) % if these two are equal, the gcd is found
            gcd_val = divXVec(i); % set the gcd 
            return; 
        end
    end
end
function div_Vec = calculate_Div(x) % function to find divisors and guarantee order

div_Vec = [1]; % initialize
i = 2; % initialize 

while i <= x 
    if mod(x,i) == 0 % mod will indicate if x is divisible i with remainder 0
        div_Vec = [div_Vec i]; % add this number as a divisor
    end
    i = i + 1; % continue adding to i while i <= x
end