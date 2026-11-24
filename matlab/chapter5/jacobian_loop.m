function [x,loop] = jacobian_loop(A,b)
    n = length(A);
    % 获取g矩阵
    g = zeros(n,n);
    for i = 1:n
        g(i,:) = -A(i,:)./A(i,i);
        g(i,i) = 0;
    end
    % 获取d向量
    d = zeros(n,1);
    for i = 1:n
        d(i) = b(i)./A(i,i);
    end
    % 迭代
    x = ones(n,1);
    tol = 10^(-6);
    loop = 0;
    while true
        loop = loop + 1;
        old = x;
        x = g*x + d;
        if norm(x-old) < tol
            break;
        end
        if loop > 5000
            x = '迭代次数过多';
            break;
        end
    end
        