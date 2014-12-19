tic;
A=fitctree(TrainFeatures,TrainingData.data(:,1),'Prior','empirical','MinLeafSize',1,'NumVariablesToSample',7,'MaxNumCategories',857);
A=prune(A);
toc;