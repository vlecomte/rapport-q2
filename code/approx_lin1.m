function line = approx_lin1(x,y)
%Computes a linear approximation y=kx+l for points (x1,y1),...,(xn,yn)
%   Uses the the scalar product
%       (f|g) = f(x1)g(x1) + ... + f(xn)g(xn)
%   to project the implicit function f(xi) = yi
%   onto the space of linear polynomials.
%   Conditions:
%       - all xi are distinct
%       - x and y have the same length

n = size(x);
% Evaluates polynomials
ev = [ones(n),x];
% Original basis
u1 = [1;0];
u2 = [0;1];
% Scalar product (u1|u2)
u1u2 = (ev*u1)' * (ev*u2);
% Orthogonal basis
v1 = u1
v2 = u2 - u1u2*u1
% Squared norms
v1v1 = (ev*v1)' * (ev*v1)
v2v2 = (ev*v2)' * (ev*v2)
% Projection:
%   instead of using an orthonormal basis,
%   we divide by the square norm
line = (ev*v1)'*y * v1/v1v1 + (ev*v2)'*y * v2/v2v2;

end
