function c = mvmultiply(a,b)

[m,n] = size(a);

if length(b) ~= n
    error('wrong size');
end

c = zeros(m,1);

for j = 1:m
    c(j) = 0;
    for k = 1:n
        c(j) = c(j)+a(j,k)*b(k);
    end
end

end