%B=TreeBagger(1,TrainingFeatureVector(101:N,:),TrainingData.data(101:N,1));

%,'CrossVal','on','KFold',2
% tic;
% A=fitctree(BalancedTrainingSet(1:NB,1:857),BalancedTrainingSet(1:NB,858));
% toc;

% tic;
% B=TreeBagger(2,TrainFeatures,TrainingData.data(:,1),'Prior','Empirical');
% %B=prune(B);
% toc;

tic;
A=fitctree(TrainFeatures,TrainingData.data(:,1),'Prior','empirical','MinLeafSize',1,'NumVariablesToSample',7);
A=prune(A);
toc;

% tic;
% B=fitctree(TrainFeatures,TrainingData.data(:,1),'Prior','empirical','MinLeafSize',5,'NumVariablesToSample',7);
% B=prune(B);
% toc;
% 
% tic;
% C=fitctree(TrainFeatures,TrainingData.data(:,1),'Prior','empirical','MinLeafSize',5,'NumVariablesToSample',7);
% C=prune(C);
% toc;
% 
% tic;
% D=fitctree(TrainFeatures,TrainingData.data(:,1),'Prior','empirical','MinLeafSize',5,'NumVariablesToSample',7);
% D=prune(D);
% toc;

% tic;
% B=fitensemble(TrainFeatures,TrainingData.data(:,1),'RUSBoost',10,'Tree');
% toc;