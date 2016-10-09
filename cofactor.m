function d = cofactor(a)
% d = COFACTOR(a) computes the determinant of an n-by-n matrix using
% the cofactor expansion formula
%
% inputs
% ------
% a: an n-by-n matrix 
%
% outputs
% -------
% d: the determinant of a
%
% examples
% --------
% d = cofactor(magic(3))

n = size(a,1);

if n == 1
    d = a;
else
    d = 0;
    for k = 1:n
        m = a;
        m(1,:) = [];
        m(:,k) = [];
        d = d+(-1)^(1+k)*a(1,k)*cofactor(m);
    end
end

end