clear;clc;
% 计算d2y/dx2=-4pi^2y
% 边界条件x=0,y=1,y'=0
% 解析解为y = cos(2pix)
% 流程是用两次rk4算出y

% 确定计算的范围x
N = 5001;
x = linspace(0,5,N);
h = x(2)-x(1);

% 这里第二个启动值是用taylor展开得到的
% 因为x=0处0,1,2,3阶导数为1,0,-4pi^2,0
% 其实奇数阶导数都是0

% 定义匿名函数f即二阶导
f = @(x,y) -4.*pi.^2.*y;
% 给y,y1分内存和启动值
y = zeros(1,N);
y1 = zeros(1,N);
y(1) = 1;
y1(1) = 0;
% 用四阶rk计算
for i = 1:N-1
    % 算y1(i+1)
    k1 = f(x(i),y1(i));
    k2 = f(x(i)+h./2,y1(i)+h./2.*k1);
    k3 = f(x(i)+h./2,y1(i)+h./2.*k2);
    k4 = f(x(i)+h,y1(i)+h.*k3);
    k = 1./6.*(k1+2.*k2+2.*k3+k4);
    y1(i+1) = y(i) + h.*k;
    % 算y(i+1)
    k1 = y1(i+1);
    k2 =


% 画图看看
plot(x,y,'r-');
hold on;
y_true = cos(2.*pi.*x);
plot(x,y_true,'b--');
legend('数值解','解析解');
