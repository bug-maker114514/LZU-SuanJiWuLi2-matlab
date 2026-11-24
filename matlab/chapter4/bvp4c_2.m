clear;clc;
% bvp4c求解phi''=-r/2e^(-r)
% 边界条件phi(0)=0,phi(infty)=1

% bvpinit
x_init = linspace(0,20,21);% 截断求解
y_init = [1;1];
solinit = bvpinit(x_init,y_init);

% 求解
sol = bvp4c(@myode,@mybc,solinit);

% 结果
x = linspace(0,20,201);
y = deval(sol,x);
pbaspect([16,9,9]);
plot(x,y(1,:),'r-');

% y1'=y2,y2'=-x/2e^(-x)
function dydx = myode(x,y)
    dydx = [y(2);-x./2.*exp(-x)];
end

% 左边y1=0,右边y1=1
function res = mybc(ya,yb)
    res = [ya(1);yb(1)-1];
end
