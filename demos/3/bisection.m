% MACM 316 - Bisection method demo
% Description: applies the bisection method to a function f(x) and outputs
% the data
% Instructor: Ben Adcock

clear all;

% Define f(x) and the root p
f = @(x) sin(x);
pexact = pi;

% Parameters
a = 1; % Left endpoint a
b = 5; % Right endpoint b
N = 100; % Maximum number of iterations
tol = 1e-15; % Tolerance

% Call the function bisfn.m
[p,data] = bisfn(f,a,b,N,tol);

% Print the data in long format
format 'long' 
data

% Plot f(x) and the computed root
figure(1);
plot([a b],[0 0],'k','LineWidth',1.5)
hold on
st = 0.0001;
x = a:st:b;
plot(x,f(x),'LineWidth',1.5);
plot(p,0,'r*','MarkerSize',8);
hold off
xlabel('x-axis','fontsize',16)
ylabel('y-axis','fontsize',16)
title('f(x) and computed root','fontsize',16);
set(gca,'FontSize',14)

% Plot the error versus iteration number
figure(2);
semilogy(abs(data(:,3)-pexact*ones(length(data),1)),'*')
xlabel('Iteration number','fontsize',16)
ylabel('Absolute error','fontsize',16)
title('Bisection method error','fontsize',16)