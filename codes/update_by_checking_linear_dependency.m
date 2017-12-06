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

% Update factors R, U by checking linear dependency of sampled fibers

% Input
% dR0 : initially sampled fibers from dX
% R0, U0 : factors at previous time step, (format : double)
% epsilon : threshold for checking linear dependency. 

% Output
% R, U : R0 -> R, U0 -> U
% dR : fibers to be added to R0

function [dR, R, U] = update_by_checking_linear_dependency(dR0, R0, U0, epsilon)

%initialize
dR = [];
R = R0;
U = U0;
  
% incrementally check linear dependency of sampled fibers.
% updated when linearly independent
for i = 1:size(dR0,2)
    x = dR0(:,i);
    y = x' * R;
    del = x' * x - y * U * y';
    if abs(del)/abs(x' * x) > epsilon % if linearly independent
        d2 = full(y * U);
        d1 = d2';
        U = [U+d1 * d2/del -d1/del;-d2/del 1/del];
        dR = [dR x];
        R = [R x];
    end
end