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

% Compute column and row distribution for sptensor (tensor toolbox package)

% Input 
% A : matrix

% Ouptut
% prow, pcol : column and row distribution 
% rids_originn, cids_origin : original ids of columns and rows of A

function [prow, rids_origin, pcol, cids_origin] = fast_sample_prob_spten(A)

Asquare = elemfun(A,@(x) x.^2);

part1 = sptensor(Asquare.subs(:,1), Asquare.vals, size(Asquare,1), @sum);
part2 = sptensor(Asquare.subs(:,2), Asquare.vals, size(Asquare,2), @sum);

prow = part1.vals ./ sum(part1.vals);
pcol = part2.vals ./ sum(part2.vals);

rids_origin = part1.subs;
cids_origin = part2.subs;