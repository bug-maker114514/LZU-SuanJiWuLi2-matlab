function [L,U,x1] = LU(A,b)
    % 初始化
    n = length(A);
    L = eye(n,n);
    U = zeros(n,n);
    % L第一列U第一行
    U(1,:) = A(1,:);
    L(:,1) = A(:,1)./U(1,1);
    % 剩余的
    for r = 2:n
        sum = 0;
        for k = 1:r-1
            sum = sum + L(r,k).*U(k,r:n);
        end
        U(r,r:n) = A(r,r:n) - sum;
        sum = 0;
        for k = 1:r-1
            sum = sum + L(r+1:n,k).*U(k,r);
        end
        L(r+1:n,r) = 1./U(r,r).*(A(r+1:n,r) - sum);
    end
    % 回带
    x0 = zeros(n,1);
    for i = 1:n
        sum = 0;
        for k = 1:i-1
            sum = sum + x0(k).*L(i,k);
        end
        x0(i) = (b(i) - sum)./L(i,i);
    end
    x1 = zeros(n,1);
    for i = n:-1:1
        sum = 0;
        for k = i+1:n
            sum = sum + x1(k).*U(i,k);
        end
        x1(i) = (x0(i) - sum)./U(i,i);
    end
    
    