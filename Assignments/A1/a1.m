x1 = linspace(0,power(10,9),65000000);
y1 = arrayfun(@(x) exp(1) - power((1 + (1/x)), x), x);
p1 = semilogy(x1, y1);
xlabel('n');
ylabel('error');
title('approximation error of e for equal increments of n')
x2 = power(2, 0:90);
y2 = arrayfun(@(x) exp(1) - power((1 + (1/x)), x), x2);
p2 = semilogx(x2,y2);
xlabel('n (powers of 2)')
ylabel('error')
title('approximation error of e for powers of 2')