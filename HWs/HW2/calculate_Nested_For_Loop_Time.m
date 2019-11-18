function time = calculate_Nested_For_Loop_Time(N)
tic
k=0;
for i1 = 1:N
    for i2 = 1:N
        for i3 = 1:N
            for i4 = 1:N
                k = k+1;
            end
        end
    end
end
time = toc