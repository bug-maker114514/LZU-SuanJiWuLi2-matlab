function x = triple_chace(A,b)
    n = length(A);
    A = [A,b];
    % 第一行转换
    A(1,:) = A(1,:)./A(1,1);
    % 第二到n行转换
    for i = 2:n
        A(i,:) = A(i,:) - A(i,i-1).*A(i-1,:);
        A(i,:) = A(i,:)./A(i,i);
    end
    % 回带
    x = zeros(n,1);
    x(n) = A(n,n+1);
    for i = n-1:-1:1
        x(i) = A(i,n+1) - x(i+1).*A(i,i+1);
    end
