# CTD
CTD: Fast, Accurate, and Interpretable Method for Static and Dynamic Tensor Decompositions

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

## Installation

This package needs 'Tensor Toolbox' package before executing.

You can download tensor toolbox from http://www.sandia.gov/~tgkolda/TensorToolbox/index-2.6.html


## Overview

The package contains the following files:

- CTD-S : static version of CTD
  + CTD_S.m

- CTD-D : dynamic version of CTD
  + CTD_D.m

- etc
 - matricize.m
 - unmatricize.m
 - fast_sample_prob.m
 - fast_sample_prob_spten.m
 - sample_rows.m
 - unmatricize.m 
 - update_by_checking_linear_dependency.m
 - demo_CTD_S.m
 - demo_CTD_D.m

## Usage

You need to first download 'Tensor Toolbox' package and add path of the package.

1. CTD-S

Type the following command to run CTD-S. 
[C, U, R, rerr, time, memory_usage] = CTD_S(X, s, alpha);
This command applies CTD-S on a tensor X with sample size s and mode alpha.

ex) [C, U, R, rerr, time, memory_usage] = CTD_S(rand(10,20,30), 100, 1);
    : apply CTD-S on random 10 by 20 by 30 dense tensor with sample size 100 and mode 1.
 
2. CTD-D

Type the following command to run CTD-D.
[R, U, C, time] = CTD_D(dX, R0, U0, C0, d, alpha);
This command applies CTD-D on a newly arrived tensor dX with sample size d, mode alpha, and factors R0, U0, C0 at previous time step.
We assume that C0 is in matricized form. 

ex) [C0, U0, R0] = CTD_S(sptenrand([10 20 30], 100), 100, 1);    
    [R, U, C, time] = CTD_D(sptenrand([10 20], 10), R0, U0, matricize(C0,1), 1, 1);
    : apply CTD-D on newly arrived tensor with sample size 1 and mode 1. We assume that factors at previous time step is given by CTD-S in this example.

3. demo

We also provide a demo file for our method CTD.

Type the following command to run the demo for CTD-S: 

	demo_CTD_S

Type the following command to run the demo for CTD-D: 

	demo_CTD_D