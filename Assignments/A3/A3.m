A = load('CA3matrix.mat');
I = eye(500);
k_50 = 50;
k_150 = 150;
expAk = I;
expAk2 = I;
expAk3 = I;
% 
% % part a (k=50)
% for n = 1:k_50
%     expAk = expAk + ((1/factorial(n)) * A.A^n);
% end
% imagesc(real(expAk));
% colormap gray
% 
% % part a (k=150)
% for n = 1:k_150
%     expAk = expAk + ((1/factorial(n)) * A.A^n);
% end
% imagesc(real(expAk));
% colormap gray
% 
% % part b
% times = [];
% for n = 5:5:150
%     tic; 
%     for i = 1:n
%         expAk2 = expAk2 + ((1/factorial(i)) * A.A^i);
%     end
%     times = [times toc];
%     expAk2 = I;
% end
% 
% plt = plot(5:5:150, times);
% xlabel("k iterations");
% ylabel("computational time");
% title("Computational time vs K iterations for exp computation");
% 
% part c
error = [];
expA = expm(A.A);
for n = 5:5:150 
    for i = 1:n
        expAk3 = expAk3 + ((1/factorial(i)) * A.A^i);
    end
    error = [error norm(expA - expAk3)/norm(expA)];
    expAk3 = I;
end

plt = semilogy(5:5:150, error);
xlabel("k iterations");
ylabel("Computational error");
title("Computational error vs K iterations for exp computation");