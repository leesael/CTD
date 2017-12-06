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

X = sptenrand([10 20 30], 100); % if you have tensor toolbox

% X = rand(10,20,30); % generate dense random 3-mode tensor of size 10 by 20 by 30

[C0, U0, R0] = CTD_S(X, 100, 1); % perform CTD-S under alpha = 1 and sample size = 100 to make factors at previous time step.

% apply CTD-D with sample size 1 and mode 1.
[R, U, C, time] = CTD_D(sptenrand([10 20], 10), R0, U0, matricize(C0,1), 1, 1); 