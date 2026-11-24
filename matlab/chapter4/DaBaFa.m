clear;clc;
% 打靶法
% 方程d2phi/dx2=-k^2phi
% 边界条件phi(0)=phi(1)=0
% 解析解Asin(npix)
% kk=k^2,S=0
% 用搜索法搜索一定范围内符合要求的k
% 以及对应的解

%初始化，y(2)大小不重要，只影响振幅
N = 101;
x = linspace(0,1,N);
h = x(2) - x(1);

y = zeros(1,N);
y(1) = 0;
y(2) = 0.01;

S = 0;

kk = 0;% 从0开始寻找符合的k^2
tol = 10^(-6);
k_slove = zeros(1,100);% 统计本征值
i = 0;

while true% 对k循环
    y = numerov(N,h,y,kk,S);
    old = y(N);
    dk = 1;
    while dk>tol 
        kk = kk + dk;
        y = numerov(N,h,y,kk,S);
        new = y(N);
        if old*new<0
            kk = kk - dk;
            dk = dk./2;
        end
    end
    if kk > 20^2
        break;%得到超出范围的k就退出
    end
    i = i + 1;
    k_slove(i) = sqrt(kk);
    kk = kk + 2.*dk;% 跳过搜索到的本征值去找下一个
    pbaspect([16,9,9]);
    plot(x,y,'r-');
    hold on;
end
disp(k_slove(1:i));