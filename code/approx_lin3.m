function line = approx_lin3(x,y)
%Computes a linear approximation y=kx+l
%       for points (x1,y1),...,(xn,yn)
%   Simply solves the overdetermined system:
%       { kx1 + l = y1
%       {  .        .
%       {  .        .
%       { kxn + l = yn
%   Conditions:
%       - all xi are distinct
%       - x and y have the same length
%   Returns:
%       [k,l]

% Matrix of coefficients
coeff = [x, ones(size(x))];
line = coeff\y;
