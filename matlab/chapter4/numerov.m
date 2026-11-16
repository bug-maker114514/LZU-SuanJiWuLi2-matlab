% 微分方程y''+k^2*y=S，其中y,k,S都是x的函数
% N:各数组长度
% h:步长
% y:y(x)数列
% kk:k^2(x)数列
% S:S(x)数列
% 目标是用kk数列、S数列、y两个启动值y(1),y(2)和步长、长度算出整个y

function y = numerov(N,h,y,kk,S)
    %判断kk,S是不是标量
    if isscalar(kk)
        kk = kk .* ones(1,N);
    end
    if isscalar(S)
        S = S.*ones(1,N);
    end
    % 简写一个常见常量
    CONS0 = h.^2./12;
    for i = 2:N-1
        % 计算y(i-1),y(i),y(i+1)系数
        CONSin1 = 1 + CONS0.*kk(i-1);
        CONSi = -2 + 10.*CONS0.*kk(i);
        CONSip1 = 1 + CONS0.*kk(i+1);
        % 计算S项
        S0 = CONS0.*(S(i+1)+S(i-1)+10.*S(i));
        % 用公式计算y(i+1)
        y(i+1) = (S0 - CONSin1.*y(i-1) - CONSi.*y(i))./CONSip1;
    end
