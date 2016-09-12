function [x,xerr,ferr,k] = newton(f,fp,x0,xtol,ftol,kmax)
% [x,xerr,ferr,k] = NEWTON(f,fp,x0,xtol,ftol,kmax) approximates the root
% of a function using Newton-Raphson iteration
%
% inputs
% ------
% f: function handle for objective function
% fp: function handle for the derivative of f
% x0: initial approximation for the root of f
% xtol: tolerance for location of the root
% ftol: tolerance for function values of the root
% kmax: maximum number of iterations
%
% outputs
% -------
% x: approximate root of objective function
% xerr: error estimate for the root
% ferr: value of f at the approximate root
% k: number of iterations required
%
% examples
% --------
% x = newton(@(x) x.^3-1, @(x) 3*x.^2, 2, 1e-6, 0, 10)

x = x0;
fx = f(x);

for k = 1:kmax
    x = x-fx/fp(x);
    xerr = abs(x-x0);
    fx = f(x);
    ferr = abs(fx);
    x0 = x;
    if (xerr < xtol) || (ferr < ftol)
        break
    end
end

end