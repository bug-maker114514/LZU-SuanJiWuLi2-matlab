clear;clc
% 微分方程y''+k^2*y=S，其中y,k,S都是x的函数
% 边界条件x=0,y=1,y'=0
% 令y1=y,y2=y'
% 化为y1'=y2,y2'=-4pi^2y1，可以用向量

% 确定x
N = 201;
x = linspace(0,2,N);
h = x(2) - x(1);
% 分配y
y = zeros(2,N);
y(1,1) = 1;
y(2,1) = 0;
% 定义f
f = @(x,y) [y(2);-4.*pi.^2.*y(1)];
% 循环
for i = 1:N-1
    k1 = f(x(i),y(:,i));
    k2 = f(x(i)+h./2,y(:,i)+h./2.*k1);
    k3 = f(x(i)+h./2,y(:,i)+h./2.*k2);
    k4 = f(x(i)+h,y(:,i)+h.*k3);
    k = 1./6.*(k1+2.*k2+2.*k3+k4);
    y(:,i+1) = y(:,i) + h.*k;
end
% 画图看看
plot(x,y(1,:),'r-');
hold on;
y_true = cos(2.*pi.*x);
pbaspect([16,9,9]);
plot(x,y_true,'b--');
legend('数值解','解析解');