% MACM 316 - Bisection vs Newton's methods demo
% Description: compares the error vs iterations for the Bisection and
% Newton's methods
% Instructor: Ben Adcock

clear all; close all;

N = 100; % Maximum number of iterations

examp = input('Select example function 1, 2 or 3 ');
switch examp
    
    case 1
        
        f = @(x) exp(x)-5; % Function f
        df = @(x) exp(x); % Derivative of f
        pexact = log(5); % Exact value of root

    case 2
        
        f = @(x) x.^3 - 2.*x+2; % Function f
        df = @(x) 3*x.^2 - 2; % Derivative of f
        pexact = -1.769292354238631; % Exact value of root
        
    case 3
        
        f = @(x) x./(1+x).^2; % Function f
        df = @(x) (1-x.^2)./(1+x.^2).^2; % Derivative of f
        pexact = 0; % Exact value of root
     
end

a = input('Select left endpoint a for bisection method ');
b = input('Select right endpoint b for bisection method ');
p0 = input('Select starting value p0 for Newton method ');

%%% Bisection method %%%
bdata = [];

for k = 1:N
    p = a+(b-a)/2;
    bdata = [bdata ; p];
    
    if (f(p)*f(a)>0)
        a = p;
    else
        b = p;
    end
end

%%% Newton's method %%%
Ndata = [];
p = p0;
for k = 1:N
    Ndata = [Ndata ; p];
    p = p-f(p)/df(p);
end

%%% Plot results %%%
figure(1)
berr = abs(bdata-pexact.*ones(N,1));
Nerr = abs(Ndata-pexact.*ones(N,1));
semilogy(1:N,berr,'*',1:N,Nerr,'r*')
set(gca,'FontSize',14)
xlabel('Iteration','fontsize',16)
ylabel('Error','fontsize',16)
legend({'Bisection','Newton'},'fontsize',16,'Location','northeast')
ylim([min(berr)/2 2*max(Nerr)])



