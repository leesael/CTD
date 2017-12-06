%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    CTD: Fast, Accurate, and Interpretable Method for Static and Dynamic Tensor Decompositions
%    Author: Jungwoo Lee, Dongjin Choi, and Sael Lee
%    
%    Version: 1.0
%    Date: August 21, 2017
%    Main Contact: Jungwoo Lee (muon9401@gmail.com)
%
%    This software is free of charge under research purposes.
%    For commercial purposes, please contact the author.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% matricization of tensor X along n-th mode

% Input
% X : tensor, (format : sptensor(tensor toolbox package) or double)
% n : mode

% Output
% Xn : matricization of X

function Xn = matricize(X, n)

N = ndims(X);

if n < 1 || n > N
    disp('n is out of range');
    return;
end

colSize = 1;

for i = [1:n-1,n+1:N]
    colSize = colSize * size(X,i);
end

Xn = permute(X,[n 1:n-1,n+1:N]);
Xn = reshape(Xn, [size(X,n), colSize]);
