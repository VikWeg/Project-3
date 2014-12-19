NumTrees=1;
CreateValidPred=true;

statset('TreeBagger');
statset('UseParallel',1);
tic;

Ensemble = TreeBagger(NumTrees,TrainFeatures,TrainingData.data(:,1),...
                      'Prior','empirical','MinLeafSize',5,'NumVariablesToSample',7,'MaxNumCategories',857);
toc;

if CreateValidPred
    
NV=length(ValidationData);
ValidPredictions=cell(NV,NumTrees);

tic;
parfor i=1:NV
    
    %pred=predict(A,ValidationFeatureVector(i,1:857));
    %predictions(i)=str2double(pred{1});
    ValidPredictions(i)=predict(Ensemble,ValidFeatures(i,:));
    %predictions(i)=predict(A,ValidFeatures(i,:));
end
toc;
 

ValidPredictionFile=fopen('ValidPredictions.csv','w+');

i=1;
while i<=NV
    fprintf(ValidPredictionFile,'%d,%d\n',ValidPredictions{i},PredictCountry(ValidPredictionspredictions{i}));  
i=i+1;
end

fclose(ValidPredictionFile);

end
    
