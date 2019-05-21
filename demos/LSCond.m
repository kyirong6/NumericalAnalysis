% MACM 316 - GE robustness and condition numbers
% Description: Computes the solution error and condition number for solving
% Ax=b, where A is either the DFT matrix or Hilbert matrix
% Instructor: Ben Adcock

clear all;

examp = 2; % 1 = DFT matrix, 2 = Hilbert matrix
Nmax = 50; % Maximum matrix size

% Intialize arrays
err = [];
kappa = [];

for N = 1:Nmax
    
    % Compute the matrix A
    if examp == 1
        A = dftmtx(N);
    else
        A = hilb(N);
    end
    
    x = ones(N,1); % Define the exact solution x
    b = A*x; % Compute the RHS b
    
    xhat = A\b; % Use backslash to solve the system
    
    % Compute the error and condition numbers
    err = [err max(abs(xhat-x))/max(abs(x))];
    kappa = [kappa cond(A)];
    
end

% Plot the error versus N
figure(1);
semilogy(err,'*')
xlabel('N','fontsize',16)
ylabel('error','fontsize',16)
set(gca,'FontSize',14)

% Plot the scaled error and condition number versus N
figure(2);
semilogy(err/eps,'*')
hold on
semilogy(kappa,'r*');
hold off
xlabel('N','fontsize',16)
ylabel('scaled error and condition number','fontsize',16)
set(gca,'FontSize',14)
h = legend({'$\mathrm{err}/\epsilon$','$\kappa(A)$'},'fontsize',16,'Location','southeast');
set(h,'Interpreter','latex');

