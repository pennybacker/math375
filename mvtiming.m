n = 100:10:1000;
t = zeros(size(n));

for k = 1:length(n)
    a = zeros(n(k));
    b = zeros(n(k),1);
    tic;
    for j = 1:10
        c = mvmultiply(a,b);
    end
    t(k) = toc/10;
end

loglog(n,t,'-',n,(n/n(end)).^2*t(end),'--');
set(gca,'fontsize',16);
xlabel('matrix size (n)');
legend('runtime','O(n^2)');
