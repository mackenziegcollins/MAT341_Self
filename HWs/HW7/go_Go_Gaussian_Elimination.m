%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This algorithm has an input of an N x N matrix and returns the operation
% count needed to put the matrix into reduced row echelon form.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function OpCount = go_Go_Gaussian_Elimination(N)

A = rand(N,N); % randomizes numbers in an NxN matrix
OpCount = 0; % initialize operation count

for i = 1:N
    
    for j = i:N
        % Rj = (aji/aii)*Ri-Rj

        for k = 1:N
            c = A(j,k)/A(i,i); % divids by ith row ith column of A
            OpCount = OpCount + 1; 
            if j == i 
                A(j,k) = c; % if j =1 no need for operation
            else
                val = c * A(i,k);
                OpCount = OpCount + 1;
                
                A(j,k) = val - A(j,k);
                OpCount = OpCount + 1;
            end
        end
    end
end

% reduced row echelon form
for i = N:-1:2
    for j = i-1:-1:1
        c = A(j,i) * A(i,i);
        OpCount = OpCount + 1;
        
        A(j,i) = A(j,i) - c;
        OpCount = OpCount + 1;
    end
end
A

% a) When testing different matrix sizes I found that N = 2 takes 12 
% operations, N = 3 takes 42 operations, and N = 4 takes 100 operations. 
% As the size of the matrix increases the number of operations requiredto 
% compute its corresponding reduced row echelon form scale with N appears 
% to be quadratic.
