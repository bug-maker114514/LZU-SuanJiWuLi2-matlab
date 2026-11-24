clear;clc;
% bvp4c求解y''+|y|=0
% 边界条件y(0)=0,y(4)=-2
% 改写成数组y1=y,y2=y'

% bvpinit
x_init = [0,1,2,3,4];
y_init = [-1;1];
solinit = bvpinit(x_init,y_init);

% bvc4c
sol = bvp4c(@myode,@mybc,solinit);

% 结果
x = linspace(0,4,401);
y = deval(sol,x);
pbaspect([16,9,9]);
plot(x,y(1,:),'r-');

% y1'=y2,y2'=-|y1|
function dydx = myode(x,y)
    dydx = [y(2);-abs(y(1))];
end

% 左边y1=0,右边y1+2=0
function res = mybc(ya,yb)
    res = [ya(1);yb(1)+2];
end