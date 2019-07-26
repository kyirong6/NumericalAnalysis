% Class: MACM 316 - computing roots of polynomials
% Description: Computes the roots of a degree n polynomial with random
% coefficients (normally distributed)
% Instructor: Ben Adcock

clear all; close all;

nmax = 500; % Max polynomial degree
nstep = 100; % Stepsize for n

figure(1);

for n = nstep:nstep:nmax
a = randn(1,n); % Random coefficients
r = roots(a); % Compute the roots

% Plot the roots in the complex plane
plot(real(r),imag(r),'*');
axis([-2 2 -2 2]);
title(['Roots in the complex plane of a random poly. of deg. n=' num2str(n)],'fontsize',14);
xlabel('Real axis','fontsize',14);
ylabel('Imaginary axis','fontsize',14);
pause;

end