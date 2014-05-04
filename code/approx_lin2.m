function line = approx_lin2(x,y)
%Computes a linear approximation y=kx+l
%       for points (x1,y1),...,(xn,yn)
%   Finds the minimum of the square distance function
%       dist^2(k,l) = (kx1+l-y1)^2 + ... + (kxn+l-xn)^2
%   using multivariate calculus.
%   Conditions:
%       - all xi are distinct
%       - x and y have the same length
%   Returns:
%       [l,k]

n = length(x);
% Expressing dist^2 under the form
%   Ak^2 + Bl^2 + Ck + Dl + Ekl + F
A = sum(x.*x);
B = n;
C = -sum(2*x.*y);
D = -sum(2*y);
E = sum(2*x);
F = sum(y.*y);
% The gradient must be zero, leading to the equations
%   { 2Ak + El + C = 0
%   { Ek + 2Bl + D = 0
coeff = [2*A E; E 2*B];
ind = [-C;-D];
line = coeff\ind;
