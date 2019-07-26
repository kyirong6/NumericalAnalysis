% Class: MACM 316 - node distribution demo
% Description: computes the polynomial interpolant of a function f on a set
% of nodes using the barycentric form.  Compares equally-spaced nodes
% with Chebyshev nodes
% Instructor: Ben Adcock

clear all; close all;

f = @(x) 1./(1+16.*x.^2); % Define function to approximate
nmax = 200; % Maximum value of n
nstep = 5; % Stepsize in n
nvalues = nstep:nstep:nmax; % Values for n
err_grid = (linspace(-1,1,10000))'; % Equally-spaced grid of 10000 nodes to compute error on
f_grid = f(err_grid);
err = [];

node_type = input('Select nodes (1 = equally-spaced, 2 = Chebyshev) ');

for n = nvalues
    
    switch node_type
        
        case 1
            x = (linspace(-1,1,n+1))'; % compute points
            
            % compute weights
            w = zeros(n+1,1);
            for j = 0:n
                w(j+1) = nchoosek(n,j)*(-1)^j;
            end
            
        case 2
            
            % compute points
            x = (linspace(0,1,n+1))';
            x = cos(pi*x);
            
            % compute weights
            w = (-1).^((0:n)');
            w(1) = 1/2; w(n+1) = w(n+1)/2;
    end
    
    y = f(x); % Evaluate f at the nodes
    p = baryinterp(x,w,y,err_grid); % Compute P(x) on the error grid
    err = [err ; max(abs(p - f_grid))];
end

semilogy(nvalues,err,'*');
set(gca,'FontSize',14);
xlabel('n','fontsize',16);
ylabel('error','fontsize',16);

switch node_type
    case 1
title('Interpolation error for equally-spaced nodes','fontsize',16);
    case 2
title('Interpolation error for Chebyshev nodes','fontsize',16);        
end