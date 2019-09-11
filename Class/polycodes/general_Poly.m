function val = general_Poly(cVec, x)
%x is scalar
%cVec could have 1 or 2 or... 100 terms
val = 0;
N= length(cVec);
for i = 1:N
    val = val + cVec(i)*x^(i-1)
end
