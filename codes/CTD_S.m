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

% CTD-S algorithm

% Input 
% X : tensor data, (format : sptensor(tensor toolbox package) or double)
% s : sample size of CTD-S
% alpha : mode of LR tensor decomposition
% epsilon : threshold for checking linear dependency. 

% Output
% C, U, R : resulting factors 
% time, rerr, memory_eff : metrics

% Example
% [C, U, R, time, rerr, memory_eff] = CTD_S(X, 100, 1);


function [C, U, R, rerr, time, memory_eff] = CTD_S(X, s, alpha, epsilon)
tic;

if nargin<4
    epsilon = 10^(-6);
end

X_mat = matricize(X, alpha); % matricization

% compute probability distribution 
if strcmp(class(X_mat), 'sptensor')
    [prow, rids_origin, pcol, cids_origin] = fast_sample_prob_spten(X_mat);
else
    [prow, pcol] = fast_sample_prob(X_mat);
end

% sample fibers according to the probability distribution
[cids] = sample_rows(s, pcol);

if strcmp(class(X_mat), 'sptensor')
    cids = cids_origin(cids);
end

% remove duplicate in sampled fibers
[tmp, cid0, ccnt] = find(sparse(1,cids,1));

R0 = double(X_mat(:,cid0));

x = R0(:,1);
[dR, R, U] = update_by_checking_linear_dependency(R0, x, 1/(x'*x), epsilon);

C = R' * double(X_mat);
% X_mat = spmatrix(X_mat);
% C = sparse(R') * X_mat;

% Compute metrics
time = toc;

rerr = norm(X_mat - sparse(R*U)*C, 'fro')^2 / norm(X_mat, 'fro')^2;

memory_eff = (nnz(R) + nnz(U) + nnz(C)) / nnz(X_mat);
