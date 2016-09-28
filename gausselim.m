function [u,c] = gausselim(a,b)
% [u,c] = GAUSSELIM(a,b) returns an upper triangular system
% u*x = c equivalent to the system a*x = b, found using
% gaussian elimination without pivoting
%
% inputs
% ------
% a: an n x n matrix
% b: an n x 1 column vector
%
% outputs
% -------
% u: an n x n upper triangular matrix
% c: an n x 1 column vector
%
% examples
% --------
% [u,c] = gausselim(magic(3),ones(3,1))

n = length(b);

for j = 1:n
    for i = j+1:n
        mult = a(i,j)/a(j,j);
        a(i,j+1:n) = a(i,j+1:n)-mult*a(j,j+1:n);
        b(i) = b(i)-mult*b(j);
    end
end

u = triu(a);
c = b;