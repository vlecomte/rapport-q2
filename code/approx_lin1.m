function line = approx_lin1(x,y)
%Computes a linear approximation y=kx+l
%       for points (x1,y1),...,(xn,yn)
%   Uses the the scalar product
%       (f|g) = f(x1)g(x1) + ... + f(xn)g(xn)
%   to project the implicit function f(xi) = yi
%   onto the space of linear polynomials.
%   Conditions:
%       - all xi are distinct
%       - x and y have the same length
%   Returns:
%       [k,l]

% Evaluates polynomials
ev = [x, ones(size(x))];

% Original basis
u1 = [0;1];
u2 = [1;0];

% Scalar product (u1|u2)
u1u2 = (ev*u1)' * (ev*u2);
% Squared norm of u1
u1u1 = (ev*u1)' * (ev*u1);

% Orthogonal basis: we subtract from u2 its projection onto <u1>
v1 = u1;
v2 = u2 - u1u2*u1/u1u1;

% Squared norms of v1 and v2
v1v1 = (ev*v1)' * (ev*v1);
v2v2 = (ev*v2)' * (ev*v2);

% Projection:
%   instead of using an orthonormal basis,
%   we divide by the square norm
line = (ev*v1)'*y * v1/v1v1 + (ev*v2)'*y * v2/v2v2;
