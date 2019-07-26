err_grid = (linspace(-1,1,10000))'; % Equally-spaced grid of 10000 nodes to compute error on
tol = 1e-10; % tolerance used to determined largest value of n

%a = 0.7; b = 1; % Set values of a,b
a = -1.25:.1:1.25;
b = -1.25:.1:1.25;
z = zeros(length(a), length(a));
%f = @(x) 1./((x-a).^2+b.^2); % Define f(x)

%f_grid = f(err_grid); % Evaluate f on the error grid
%errvals = []; % Initialize an error vector
%err = 1; % set the error initially to 1
%n = 0; % initialize n


for i = 1:length(a)
    for j = 1:length(a)
    
        f = @(x) 1./((x-abs(a(j))).^2+abs(b(i)).^2); % Define f(x)
        f_grid = f(err_grid);
        errvals = []; % Initialize an error vector
        err = 1; % set the error initially to 1
        n = 0; % initialize n

        while err > tol
            n = n+1;

            % compute points
            x = (linspace(0,1,n+1))';
            x = cos(pi*x);

            % compute weights
            w = (-1).^((0:n)');
            w(1) = 1/2; w(n+1) = w(n+1)/2;

            y = f(x); % Evaluate f at the nodes
            p = baryinterp(x,w,y,err_grid); % Compute P(x) on the error grid
            err = max(abs(p - f_grid)); % Compute error
            errvals = [errvals err]; % Update error vector

        end
        logerr = log(errvals);
        coeff = polyfit(1:n,logerr, 1);
        vals = polyval(coeff, 1:n);
        evals = exp(vals);
        p = evals(2)/evals(3);
        z(i,j) = p;
    end 
end

%cont = [a,b,z];
contour(a,b,z,'ShowText','on','LineWidth', 1)

% produce line of best fit
%{
logerr = log(errvals);
coeff = polyfit(1:n,logerr, 1)
vals = polyval(coeff, 1:n);

figure(1);
semilogy(1:n,errvals,'*');
hold on
semilogy(1:n, exp(vals), 'r','linewidth',3); % plot the line of best fit
hold off

set(gca,'FontSize',14);
xlabel('n','fontsize',16);
ylabel('error','fontsize',16);
legend({'Error','Fitted Line'},'fontsize', 16, 'Location','northeast')
%}

