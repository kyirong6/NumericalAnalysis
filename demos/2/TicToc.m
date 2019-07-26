% MACM 316 - Computational time demo
% Description: Finds the mean computation time for Gaussian Elimination on a
% random matrix
% Instructor: Ben Adcock

trials = 50; % Number of trials
N = 1000; % Matrix size
times = zeros(trials,1); % Array of timing data for the trials

for i=1:trials
    
    % Form a random matrix A and right-hand side b (normally distributed)
    A = randn(N,N);
    b = randn(N,1);
    
    % Apply backslash and calculate time taken
    tic;
    x = A\b;
    times(i) = toc;
    
end

N
mean_time = mean(times)
