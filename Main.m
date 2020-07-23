%-------------------------------------------------------------------------%
%  Binary Tree Growth Algorithm (BTGA) source codes demo version          %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%


%---Inputs-----------------------------------------------------------------
% feat:   features
% label:  labelling
% N:      Number of trees
% T:      Maximum number of iterations
% N1:     Number of trees in first group
% N2:     Number of trees in second group
% N4:     Number of trees in fourth group
% theta:  Tree reduction rate
% lambda: Parameter controls nearest tree
% *Note: k-value of KNN & hold-out setting can be modified in jFitnessFunction.m
%---Outputs----------------------------------------------------------------
% sFeat:  Selected features
% Sf:     Selected feature index
% Nf:     Number of selected features
% curve:  Convergence curve
%--------------------------------------------------------------------------



%% Binary Tree Growth Algorithm  
clc, clear, close 
% Benchmark data set 
load ionosphere.mat; 
% Parameter setting
N=10; T=100; N1=3; N2=5; N4=3; theta=0.8; lambda=0.5; 
% Binary Tree Growth Algorithm 
[sFeat,Sf,Nf,curve]=jBTGA(feat,label,N,T,N1,N2,N4,theta,lambda);
% Plot convergence curve
figure(); plot(1:T,curve); xlabel('Number of iterations');
ylabel('Fitness Value'); title('BTGA'); grid on;




