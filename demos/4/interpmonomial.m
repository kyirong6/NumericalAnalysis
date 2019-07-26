% Class: MACM 316 - monomial basis demo
% Description: computes the polynomial interpolant of a function f on a set
% of points x by using the monomial basis {1,x,...,x^n} and solving the
% resulting Vandermonde system of equations.  Compares the result to
% polynomial interpolating using the barycentric form
% Instructor: Ben Adcock

clear all; close all;

f = @(x) 1./(1+16.*x.^2); % Define function to approximate
nmax = 100; % Maximum value of n
nstep = 5; % Stepsize in n
nvalues = nstep:nstep:nmax; % Values for n
x_grid = (linspace(-1,1,10000))'; % Equally-spaced grid of 10000 nodes to compute error on
f_grid = f(x_grid);
errmono = [];
errbary = [];

figure(1);
for n = nvalues
    
    % Compute Chebyshev points
    x = (linspace(0,1,n+1))';
    x = cos(pi*x);
    
    % Compute P(x) using monomial basis
    V = vander(x); % Form Vandermonde matrix based on the points x
    b = f(x); % Construct right-hand side
    a = V\b; % Solve the linear system Va = b
    Pmono_grid = polyval(a,x_grid); % Evaluate the interpolating polynomial P(x)
    errmono = [errmono max(abs(f_grid-Pmono_grid))]; % Compute error
    
    % Compute P(x) using barycentric form
    w = (-1).^((0:n)'); % compute barycentric weights
    w(1) = 1/2; w(n+1) = w(n+1)/2;
    Pbary_grid = baryinterp(x,w,b,x_grid); % Compute P(x) on the error grid
    errbary = [errbary max(abs(f_grid-Pbary_grid))]; % Compute error
    
    % Plot results
    plot(x_grid,f_grid,x_grid,Pmono_grid,x_grid,Pbary_grid,'Linewidth',2);
    axis([-1 1 -2 2]);
    xlabel('x-axis','fontsize',14);
    ylabel('y-axis','fontsize',14);
    title(['Polynomial interpolation n = ',num2str(n)],'fontsize',16);
    legend({'f(x)','Monomial form','Barycentric form'},'fontsize',14,'Location','northwest');
    
    pause;
    
end

% Plot error versus n
figure(2);
semilogy(nvalues,errmono,'*',nvalues,errbary,'*');
set(gca,'FontSize',14);
xlabel('n','fontsize',16);
ylabel('error','fontsize',16);
title('Interpolation error','fontsize',16);
legend({'Monomial form','Barycentric form'},'fontsize',14,'Location','northwest');
