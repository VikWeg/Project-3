tic;
A=fitctree(TrainFeatures,TrainingData.data(:,1),'Prior','empirical','MinLeafSize',5,'NumVariablesToSample',47,'MaxNumCategories',857);
A=prune(A);
toc;