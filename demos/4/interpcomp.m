% Class: MACM 316 - cubic spline demo
% Description: compares cubic spline and polynomial interpolation on
% equally-spaced nodes
% Instructor: Ben Adcock

clear all; close all;

f = @(x) 1./(1+16.*x.^2); % Define function to approximate
nmax = 100; % Maximum value of n
nstep = 5; % Stepsize in n
nvalues = nstep:nstep:nmax; % Values for n
x_grid = (linspace(-1,1,10000))'; % Equally-spaced grid of 10000 nodes to compute error on
f_grid = f(x_grid);
errcub = [];
errpoly = [];

figure(1);
for n = nvalues
    
    x = (linspace(-1,1,n+1))'; % compute equally-spaced points
    b = f(x); % evaluate f at the points
    
    % Compute P(x) using barycentric form
    w = zeros(n+1,1);
    for j = 0:n
        w(j+1) = nchoosek(n,j)*(-1)^j;
    end
    
    P_grid = baryinterp(x,w,b,x_grid); % Compute P(x) on the error grid
    errpoly = [errpoly max(abs(f_grid-P_grid))]; % Compute error
    
    % Compute S(x)
    S_grid = spline(x,b,x_grid);
    errcub = [errcub max(abs(f_grid - S_grid))];
    
    % Plot results
    plot(x_grid,f_grid,x_grid,S_grid,x_grid,P_grid,'Linewidth',2);
    axis([-1 1 -2 2]);
    xlabel('x-axis','fontsize',14);
    ylabel('y-axis','fontsize',14);
    title(['Polynomial interpolation n = ',num2str(n)],'fontsize',16);
    legend({'f(x)','Cubic spline','Polynomial'},'fontsize',14,'Location','northwest');
    
    pause;
    
end

% Plot error versus n
figure(2);
semilogy(nvalues,errcub,'*',nvalues,errpoly,'*');
set(gca,'FontSize',14);
xlabel('n','fontsize',16);
ylabel('error','fontsize',16);
title('Interpolation error','fontsize',16);
legend({'Cubic spline','Polynomial'},'fontsize',14,'Location','northwest');
