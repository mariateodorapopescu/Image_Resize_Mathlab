function B = invert(A)
[n m] = size(A); 
I = eye(n);
T = [A I]; 
for i = 1 : (n-1)
    cv = T(i,i);
    T(i, :) = T(i, :) / cv; 
    for j = i : (n - 1)
        T((j+1) , :) = T((j+1), :) - T(i, :) * T((j+1), i); 
    end
end
T(n, :) = T(n, :) / T(n, n); 
for i = 2 : n
    for j = (i-1) : -1 : 1
        T(j, :) = T(j, :) - T(i, :) * T(j, i); 
    end
end
B = T(:,(n+1) : (2*n));
end