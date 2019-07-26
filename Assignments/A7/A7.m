format long
f = @(x) power(x,-1) .* sin(power(x,-1) .* log(x));
n = 50:50:500;
Q_n = [];


% part 1

%{
for j = 1:length(n)
    a = [];
    n(j)
    for i = 1:(n(j) + 1)
        b = fzero(@(x) x*exp(x)-i*pi,0);
        a = [a exp(-b)];
    end
    q = integral(f, a(1), 1);
    for p = 1:(n(j))
        q = q + integral(f, a(p + 1), a(p));
    end
    q
    Q_n = [Q_n, q];
end
%----------------------------------------------------------------------

% part 2

Q_n_hat = [];
for j = 1:length(n)
    a = [];
    n(j)
    for i = 1:(n(j) + 1)
        b = fzero(@(x) x*exp(x)-i*pi,0);
        a = [a exp(-b)];
    end
    q = integral(f, a(1), 1);
    for p = 1:(n(j))
        q = q + integral(f, a(p + 1), a(p));
    end
    a_1=[];
    for i = 1:(n(j) + 2)
        b = fzero(@(x) x*exp(x)-i*pi,0);
        a_1 = [a_1 exp(-b)];
    end
    q_n_1 = integral(f, a_1(1), 1);
    for p = 1:(n(j) + 1)
        q_n_1 = q_n_1 + integral(f, a_1(p + 1), a_1(p));
    end
    a_2 = [];
    for i = 1:(n(j) + 3)
       b = fzero(@(x) x*exp(x)-i*pi,0);
       a_2 = [a_2 exp(-b)];
    end
    
    q_n_2 = integral(f, a_2(1), 1);
    for p = 1:(n(j) + 2)
        q_n_2 = q_n_2 + integral(f, a_2(p + 1), a_2(p));
    end
    
    q_hat = q - ((power(q_n_1 - q, 2)) / (q_n_2 - (2*q_n_1) + q))
    Q_n_hat = [Q_n_hat q_hat];
end
%}
%----------------------------------------------------------------------

% part 3

I = @(s) power(x,-1) .* sin(power(x,-s) .* log(x));

Q_n_hat = [];
for s = 1:5:100
    I = @(x) power(x,-1) .* sin(power(x,-s) .* log(x));
    a = [];
    for i = 1:(500 + 1)
        b = fzero(@(x) (x)*exp(x*s)-i*pi,0);
        a = [a exp(-b)];
    end
    q = integral(f, a(1), 1);
    for p = 1:(500)
        q = q + integral(I, a(p + 1), a(p));
    end
    a_1=[];
    for i = 1:(500 + 2)
        b = fzero(@(x) (x)*exp(x*s)-i*pi,0);
        a_1 = [a_1 exp(-b)];
    end
    q_n_1 = integral(f, a_1(1), 1);
    for p = 1:(500 + 1)
        q_n_1 = q_n_1 + integral(I, a_1(p + 1), a_1(p));
    end
    a_2 = [];
    for i = 1:(500 + 3)
       b = fzero(@(x) (x*s)*exp(x*s)-i*pi,0);
       a_2 = [a_2 exp(-b)];
    end
    
    q_n_2 = integral(f, a_2(1), 1);
    for p = 1:(500 + 2)
        q_n_2 = q_n_2 + integral(I, a_2(p + 1), a_2(p));
    end
    
    q_hat = q - ((power(q_n_1 - q, 2)) / (q_n_2 - (2*q_n_1) + q));
    Q_n_hat = [Q_n_hat q_hat];
end

plot(1:5:100, Q_n_hat)
xlabel('p')
ylabel('I(p)')
title('I(p) vs p')
        