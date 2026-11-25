clear;clc;
n = 96;
A = zeros(n);
A(1,1) = -2;
for i = 2:n
    A(i,i) = -2;
    A(i,i-1) = 1;
    A(i-1,i) = 1;
end
D = eigenvalue(A);
