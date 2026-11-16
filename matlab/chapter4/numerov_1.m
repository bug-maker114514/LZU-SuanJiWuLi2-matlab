clear;clc;
% 计算d2y/dx2=-4pi^2y
% 边界条件x=0,y=1,y'=0
% 解析解为y = cos(2pix)
% 显然kk数列为常数列，kk=4pi^2
% 显然S数列为常数列，S=0

% 确定计算的范围x
N = 201;
x = linspace(0,2,N);
h = x(2)-x(1);
% 确定kk,S
kk(1:N) = 4.*pi.^2;
S(1:N) = 0;
% 分配y内存，确定启动值
y = zeros(1,N);
y(1) = 1;
y(2) = 1 - 2.*pi.^2.*h.^2;
% 这里第二个启动值是用taylor展开得到的
% 因为x=0处0,1,2,3阶导数为1,0,-4pi^2,0
% 其实奇数阶导数都是0

% 用numerov解
y = numerov(N,h,y,kk,S);
% 画图看看
plot(x,y,'r-');
hold on;
y_true = cos(2.*pi.*x);
plot(x,y_true,'b--');
legend('数值解','解析解');