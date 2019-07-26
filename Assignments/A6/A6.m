k = @(x) (1/(y*sqrt(2*pi))) * exp((-power(x,2))/(2*power(y,2)));
y = 0.1;
points = linspace(0,1,1024);
A = ones(32);
n=1024;

for i = 1:length(A)
    for j = 1:length(A)
        A(i,j) = (1/n) * k((i/n)-(j/n));
    end
end
A

