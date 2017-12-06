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

% Sample fibers according to the probability distribution

% Input 
% s : number of fibers to sample
% probs : probability distribution

% Output 
% inds : index of sampled fibers

function [inds] = sample_rows(s, probs)

prob_rows = cumsum(probs);

rand_rows = rand(s,1);

for i=1:s
    tmp = find(prob_rows > rand_rows(i));
    tmp_i(i) = tmp(1);
end
inds = tmp_i;
