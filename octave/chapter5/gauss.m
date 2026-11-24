function slove = gauss(A)
    % 获取行m和列n
    D = size(A);
    m = D(1);
    n = D(2);
    % 循环
    i = 1;% 主元行
    j = 1;% 主元列
    while j < n && i <= m
        % 找到第j列最大位置index交换index行和第i行
        [max0,index0] = max(abs(A(i:m,j)));
        index = index0 + i - 1;
        temp = A(index,:);
        A(index,:) = A(i,:);
        A(i,:) = temp;
        % 判断主元是不是0,是就把主元位置向右挪一个并重新循环
        if abs(A(i,j)) <= 10^(-6)
            j = j + 1;
            continue;
        end
        % 消除第i+1到m行
        for k = i+1:m
            A(k,:) = A(k,:) - A(i,:).*A(k,j)./A(i,j);
        end
        % 移动主元位置
        i = i + 1;
        j = j + 1;
    end
    % 判断是否有唯一解
    yes = 0;
    if m+1 == n
        yes = 1;
        for l = 1:m
            if abs(A(l,l)) < 10^(-6)
                yes = 0;
            end
        end
    end
    if yes == 0
        slove = '没有确定的解';
    else
        % 回带
        slove = zeros(m,1);
        for i = m:-1:1
            sum1 = 0;
            for j = i+1:m
                sum1 = sum1 + slove(j).*A(i,j);
            end
            slove(i) = (A(i,n) - sum1)./A(i,i);
        end
    end
