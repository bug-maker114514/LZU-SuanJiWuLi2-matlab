% 四阶RK算法
% N:数组长度
% h:步长
% y:y(x)数列
% 目标是用匿名函数f即导数和启动值，算出整个y

function y = rk4(N,h,y,f)
    for i = 1:N-1
        k1 = f(x(i),y(i));
        k2 = f(x(i)+h./2,y(i)+h./2.*k1);
        k3 = f(x(i)+h./2,y(i)+h./2.*k2);
        k4 = f(x(i)+h,y(i)+h.*k3);
        k = 1./6.*(k1+2.*k2+2.*k3+k4);
        y(i+1) = y(i)+h.*k;
    end

