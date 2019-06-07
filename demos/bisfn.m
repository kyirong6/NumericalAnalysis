function [p,data] = bisfn(f,a,b,N,tol)
% MACM 316 - Matlab function for the bisection method
% Instructor: Ben Adcock
%
% Inputs: 
% f - the function
% a,b - interval endpoints
% N - maximum number of iterations
% tol - desired tolerance
%
% Outputs:
% p - the computed root
% data - table of values for [k ak bk rk] where k is the iteration count,
% ak, bk and rk are the values of a, b and r at step k

data=[];

% Check that neither endpoint is a root, and if f(a) and f(b) have the same
% sign, output an error.
if (f(a) == 0)
    p = a;
    return;
elseif (f(b) == 0)
    p = b;
    return;
elseif (sign(f(a)) * sign(f(b)) > 0)
    error( 'f(a) and f(b) do not have opposite signs' );
end

% Perform the bisection method with N iterations, outputting an error if
% the tolerance tol is not met.
for k = 1:N
    p = a+(b-a)/2;
    data=[data ; k a b p];
    
    if (f(p) == 0 || (b-a)/2<tol)
        p = p;
        return;
    elseif (sign(f(p))*sign(f(a))>0)
        a = p;
    else
        b = p;
    end
end

error('the method did not converge in the max number of iterations');
end