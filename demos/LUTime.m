% MACM 316 - Linear solve with matrix factorization time demo
% Description: Compares the time of solving Ax=b with GE directly with that
% of factorizing A=LU first and then back/forwards substitution
% Instructor: Ben Adcock

nmax = 2000; % Max value of N
nstep = 100; % Stepsize for N

time1 = zeros(nmax/nstep,1); % Vector of times for Direct GE
time2 = zeros(nmax/nstep,1); % Vector of times for Factorized GE

for n = nstep:nstep:nmax
    
    % Form the DFT matrix A and right-hand side b (vector of ones)
    A = dftmtx(n);
    b = ones(n,1);
    
    % Apply backslash and calculate time taken
    tic;
    x = A\b;
    time1(n/nstep) = toc;
    
    % Factorize A
    [L,U] = lu(A);
    
    % Apply back/forwards subsitution and calculate time take
    tic;
    z = (U\(L\b));
    time2(n/nstep) = toc;
    
end

%%

plot(1:nstep:nmax,time1,'*',1:nstep:nmax,time2,'r*')
xlabel('N','fontsize',16)
ylabel('Time','fontsize',16)
set(gca,'FontSize',14)
legend({'Direct GE','Factorized GE'},'fontsize',16,'Location','northwest')
