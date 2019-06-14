% function to compute algorithm
function [a,b,c] = minima(f, an, bn, cn)
gamma = (3-sqrt(5))/2;


if ( (cn-bn) > (bn-an) )
    x = bn + gamma * ( cn - bn );
elseif ( (cn-bn) < (bn-an) )
    x = bn + gamma * ( an - bn );
end

if ( x<bn && f(x)<f(bn) )
    a = an;
    b = x;
    c = bn;
elseif ( x<bn && f(x)>f(bn) )
    a = x;
    b = bn;
    c = cn;
elseif ( x>bn && f(x)<f(bn) )
    a = bn;
    b = x;
    c = cn;
else
    a = an;
    b = bn;
    c = x;
    
end