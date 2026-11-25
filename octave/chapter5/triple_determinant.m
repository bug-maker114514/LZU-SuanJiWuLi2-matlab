function D = triple_determinant(A)
    n = length(A);
    P = zeros(1,n);
    P(1) = A(1,1);
    P(2) = A(2,2).*A(1,1)-A(1,2).*A(2,1);
    for i = 3:n
        P(i) = A(i,i).*P(i-1)-A(i,i-1).*A(i-1,i).*P(i-2);
    end
    D = P(n);
