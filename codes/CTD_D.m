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

% CTD-D algorithm. Update factors quickly using factors at previous time step

% Input
% dX : newly arrived tensor, (format : sptensor (tensor toolbox package))
% R0, U0, C0 : factors at previous time step, R0 and U0 are in double format
% d : number of fibers to sample from dX
% alpha : mode
% epsilon : threshold for checking linear dependency. 

% Output
% R, U, C : factors at the next time step 
% time : time for updating factors

% Example
% [R, U, C, time] = CTD_D(dX, R0, U0, C0, 1, 1);

function [R, U, C, time] = CTD_D(dX, R0, U0, C0, d, alpha, epsilon)

tic;

if nargin < 7
    epsilon = 10^(-6);
end

% matricization
dX_mat = matricize(dX, alpha);

% compute probability distribution 
if strcmp(class(dX_mat), 'sptensor')
    [prow, rids_origin, pcol, cids_origin] = fast_sample_prob_spten(dX_mat);
else
    [prow, pcol] = fast_sample_prob(dX_mat);
end

% sample fibers according to the probability distribution
[cids] = sample_rows(d, pcol);

if strcmp(class(dX_mat), 'sptensor')
    cids = cids_origin(cids);
end

% remove duplicate in sampled fibers  
[tmp, cid0, ccnt] = find(sparse(1,cids,1));

dX_mat = double(dX_mat);
dR0 = dX_mat(:,cid0);

[dR, R, U] = update_by_checking_linear_dependency(dR0, R0, U0, epsilon);

if ~isempty(dR)
    C = [C0 R0'*dX_mat; dR'*R0*U0*C0 dR'*dX_mat];
else
    dR = R'*dX_mat;
    C = cat(2, C0, dR);
end

time = toc;
