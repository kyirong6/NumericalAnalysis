% MACM 316 - Failure of nested forms demo
% Description: Computes the error in evaluating the polynomial p(x) = (x-2)^9
% from its coefficients using polyval
% Instructor: Ben Adcock

a = [1 -18 144 -672 2016 -4032 5376 -4608 2304 -512]; % Vector of coefficients of p(x)
xvalues = linspace(0,3,5000); % Define a linearly-spaced set of points between x = 0 and x = 3
err = []; % Initialize an error array

% Loop over the x values and compute the error of polyval
for x = xvalues
    
    eval1 = (x-2)^9; % Evaluate p(x) directly
    eval2 = polyval(a,x); % Evaluate p(x) from its coefficients a using polyval
    
    err = [err abs(eval1-eval2)/abs(eval1)]; % Update the error array
end

% Plot the error versus x in log scale
semilogy(xvalues,err);
xlabel('x','fontsize',16)
ylabel('error','fontsize',16)
set(gca,'FontSize',14)




