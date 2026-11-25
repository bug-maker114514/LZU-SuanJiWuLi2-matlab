function lambda = eigenvalue(A)
    n = length(A);
    I = eye(n);
    % 找搜索范围上下限
    mins = zeros(1,n);
    maxs = zeros(1,n);
    for i = 1:n
        sum = 0;
        for j = [1:i-1,i+1:n]
            sum = sum + abs(A(i,j));
        end
        mins(i) = A(i,i)-sum;
        maxs(i) = A(i,i)+sum;
    end
    low = min(mins);
    high = min(maxs);
    % 在范围内搜索
    k = low;
    tol = 10^(-6);
    lambda = zeros(1,200);
    i = 0;
    while true
        D_old = triple_determinant(A-k*eye(n));
        dk = 0.1;
        while true
            k = k + dk;
            D_new = triple_determinant(A-k*eye(n));
            if abs(dk) < tol
                break;
            end
            if D_old*D_new < 0
                k = k - dk;
                dk = dk/2;
            end
        end
        if k > high
            break;
        end
        i = i + 1;
        lambda(i) = k;
        k = k + dk;
    end
