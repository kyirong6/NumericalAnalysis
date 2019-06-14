% part 1
%f = @(x) -cos(x)/(1 + power(x,2));

% part 2
%k = 5;
%k = 9;
k = 3;
f = @(x) -cos(power(x,k))/(1 + power(x,2*k));

% params
minimum = 0;
N = 100;
an = -1;
bn = 1/2;
cn = 1;
error=1:N;

for i = 1:N
    [an,bn,cn] = minima(f, an, bn, cn);
    error(i) = abs(minimum-bn);
end

semilogy(1:N,error, 'b')  % Plot the error versus iteration number
%title('Error VS Iteration Count')
title('Error vs Iteration count when k = 3')
xlabel('Iteration Count')
ylabel('Absolute Error')
grid on;


