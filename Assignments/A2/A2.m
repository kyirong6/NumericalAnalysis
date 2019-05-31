nmax = 2000;
trials = 20;
steps = 20;

times1 = []; % Vector of times for GE
times2 = []; % Vector of times for QR
errors1 = []; % Vector of error for GE
errors2 = []; % Vector of error for QR

for N = 1:steps:nmax

    x = ones(N,1);
    times1_raw = zeros(trials,1); % raw Vector of times for GE
    times2_raw = zeros(trials,1); % raw Vector of times for QR
    errors1_raw = zeros(trials,1); % raw Vector of error for GE
    errors2_raw = zeros(trials,1); % raw Vector of error for QR
    for i = 1:trials
        
        A = randn(N,N);
        b = A*x;
        tic;
        xhat = A\b;
        times1_raw(i) = toc;
        errors1_raw(i) = max(abs(xhat - x));
        tic;
        [Q,R] = qr(A);
        xhat2 = R\(transpose(Q)*b);
        times2_raw(i) = toc;
        errors2_raw(i) = max(abs(xhat2 - x));
        
    end
    
    times1 = [times1 mean(times1_raw)];
    errors1 = [errors1 mean(errors1_raw)];
    times2 = [times2 mean(times2_raw)];
    errors2 = [errors2 mean(errors2_raw)];
end
figure(1)
plt = semilogy(1:steps:nmax, times1, '*', 1:steps:nmax, times2, 'r*')
xlabel('NxN Matrix');
ylabel('Completion Time');
title('Computational Time of GE vs QR')
legend({'GE with Partial Pivoting','QR Factorization'},'fontsize', 16, 'Location','northwest')
figure(2)
plt2 = semilogy(1:steps:nmax, errors1, '*', 1:steps:nmax, errors2, 'r*')
xlabel('NxN Matix');
ylabel('Error');
title('Computational Error of GE vs QR')
legend({'GE with Partial Pivoting','QR Factorization'},'fontsize',16, 'Location','northwest')
    