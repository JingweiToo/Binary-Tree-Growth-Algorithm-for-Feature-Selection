%-------------------------------------------------------------------%
%  Binary Tree Growth Algorithm (BTGA) demo version                 %
%-------------------------------------------------------------------%


%---Input------------------------------------------------------------
% feat     : feature vector (instances x features)
% label    : label vector (instances x 1)
% N        : Number of trees
% max_Iter : Maximum number of iterations
% N1       : Number of trees in first group
% N2       : Number of trees in second group
% N4       : Number of trees in fourth group
% theta    : Tree reduction rate
% lambda   : Parameter controls nearest tree

%---Output-----------------------------------------------------------
% sFeat    : Selected features (instances x features)
% Sf       : Selected feature index
% Nf       : Number of selected features
% curve    : Convergence curve
%--------------------------------------------------------------------


%% Binary Tree Growth Algorithm  
clc, clear, close 
% Benchmark data set 
load ionosphere.mat; 

% Set 20% data as validation set
ho = 0.2; 
% Hold-out method
HO = cvpartition(label,'HoldOut',ho,'Stratify',false);

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



