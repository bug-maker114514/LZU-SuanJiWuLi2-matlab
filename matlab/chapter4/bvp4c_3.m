clear;clc;
% bvp4c求解y''=-y(\lambda-10cos(2x))
% 边界条件y'(0)=0,y'(pi)=0

% 手动组装solinit
% y猜测cos(4x)，lambda猜测0
solinit.x = linspace(0,pi,400);
solinit.y = [cos(4.*solinit.x);-4.*sin(4.*solinit.x)];
solinit.parameters = 10;

% 求解
sol = bvp4c(@myode,@mybc,solinit);

% 结果
lambda = sol.parameters;
disp(lambda);
x = linspace(0,pi,1000);
y = deval(sol,x);
plot(x,y(1,:),'r-');

% y1'=y2,y2'=-y1(lambda-10cos2x)
function dydx = myode(x,y,lambda)
    dydx = [y(2);-y(1).*(lambda-10.*cos(2.*x))];
end

% 左边y(2)=0，右边y(2)=0，定标条件左边y(1)=1
function res = mybc(ya,yb,lambda)
    res = [ya(2);yb(2);ya(1)-1];
end