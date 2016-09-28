function x = backsub(a,b)
% x = BACKSUB(a,b) computes the solution of an upper triangular
% system a*x = b using back-substitution
%
% inputs
% ------
% a: an n x n upper triangular matrix
% b: an n x 1 column vector
%
% outputs
% -------
% x: the n x 1 solution to the system a*x = b
%
% notes
% -----
% the matrix a need not actually be upper triangular, but only
% its upper triangular part is used
%
% examples
% --------
% x = backsub(triu(magic(3)),ones(3,1))

n = length(b);
x = zeros(n,1);

for k = n:-1:1
    x(k) = b(k);
    for j = k+1:n
        x(k) = x(k)-a(k,j)*x(j);
    end
    x(k) = x(k)/a(k,k);
end

end