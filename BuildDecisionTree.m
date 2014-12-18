%B=TreeBagger(1,TrainingFeatureVector(101:N,:),TrainingData.data(101:N,1));

%,'CrossVal','on','KFold',2
% tic;
% A=fitctree(BalancedTrainingSet(1:NB,1:857),BalancedTrainingSet(1:NB,858));
% toc;

% tic;
% B=TreeBagger(3,BalancedTrainingSet(1:NB,1:857),BalancedTrainingSet(1:NB,858));
% toc;

tic;
C=fitctree(SparseBalancedTrainingSet(1:NB,1:857),SparseBalancedTrainingSet(1:NB,858));
toc;