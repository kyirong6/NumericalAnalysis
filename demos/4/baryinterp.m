function u = baryinterp(x,w,y,grid)

n = length(x);
m = length(grid);

u = zeros(m,1);

for i = 1:m
    
    diff = grid(i).*ones(n,1)-x;
    l = sum(diff == 0);
   
    if l == 0
       z = w./diff;
       u(i) = (z'*y)/sum(z);
    else
        u(i) = y(find(diff == 0));
    end
end
  
end

