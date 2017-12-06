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

% Change matricized tensor into original tensor

% Input 

% Xn : matricized tensor
% dims : dimensions of the original tensor
% n : the mode along which X is matricized into Xn 

% Output 
% X : original tensor

% Example
% X = unmatricize(Xn, [3 4 5], 2);

function X = unmatricize(Xn, dims, n)

N = length(dims);

if n < 1 || n > N
    disp('n is out of range');
    return;
end

X = reshape(Xn, [dims(n), dims([1:n-1 n+1:N])]);
X = permute(X,[2:n, 1, n+1:N]);