function r = bisect(f,a,b,tol)
% r = BISECT(f,a,b,tol) approximates the root of a function
% using the method of bisection
%
% inputs
% ------
% f: function handle for objective function
% a,b: points satisfying b > a and f(a)*f(b) < 0
% tol: tolerance for approximate root
%
% outputs
% -------
% r: approximate root of objective function
%
% examples
% --------
% r = bisect(@(x) x.^3, -1, 2, 1e-6) 

fa = f(a);
fb = f(b);

if fa*fb > 0
    error('objective function must change signs');
end

r = bisectguts(f,a,b,tol,fa,fb);

end

function r = bisectguts(f,a,b,tol,fa,fb)

c = (a+b)/2;

if (b-a)/2 < tol
    r = c;
    return
end

fc = f(c);

if fc == 0
    r = c;
elseif fa*fc < 0
    r = bisectguts(f,a,c,tol,fa,fc);
else
    r = bisectguts(f,c,b,tol,fc,fb);
end

end