# Binary Tree Growth Algorithm for Feature Selection

![Wheel](https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/9321f2c4-a795-454e-9680-8c316072c42e/314ca7d9-da3d-4424-9e6d-ad7f329fb70f/images/1595415891.JPG)


## Introduction

* This toolbox offers a Binary Tree Growth Algorithm ( BTGA )  
* The < Main.m file > illustrates the example of how BTGA can solve the feature selection problem using benchmark data-set. 


## Input
* *feat*     : feature vector ( Instances *x* Features )
* *label*    : label vector ( Instances *x* 1 )
* *N*        : number of trees
* *max_Iter* : maximum number of iterations
* *N1*       : number of trees in first group
* *N2*       : number of trees in second group
* *N4*       : number of trees in fourth group
* *theta*    : tree reduction rate
* *lambda*   : parameter controls nearest tree


## Output
* *sFeat*    : selected features
* *Sf*       : selected feature index
* *Nf*       : number of selected features
* *curve*    : convergence curve


### Example
```code
% Benchmark data set 
load ionosphere.mat; 

% Set 20% data as validation set
ho = 0.2; 
% Hold-out method
HO = cvpartition(label,'HoldOut',ho);

% Parameter setting
N        = 10;
max_Iter = 100;
N1       = 3; 
N2       = 5;
N4       = 3;
theta    = 0.8;
lambda   = 0.5; 
% Binary Tree Growth Algorithm 
[sFeat,Sf,Nf,curve] = jBTGA(feat,label,N,max_Iter,N1,N2,N4,theta,lambda,HO);

% Plot convergence curve
plot(1:max_Iter,curve);
xlabel('Number of iterations');
ylabel('Fitness Value');
title('BTGA'); grid on;
```

## Requirement
* MATLAB 2014 or above
* Statistics and Machine Learning Toolbox


## Cite As
```code
@article{too2018feature,
  title={Feature selection based on binary tree growth algorithm for the classification of Myoelectric Signals},
  author={Too, Jingwei and Abdullah, Abdul Rahim and Mohd Saad, Norhashimah and Mohd Ali, Nursabillilah},
  journal={Machines},
  volume={6},
  number={4},
  pages={65},
  year={2018},
  publisher={Multidisciplinary Digital Publishing Institute}
}
```

