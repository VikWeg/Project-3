
NV=length(ValidationData);
NumTrees=2;

prediction=zeros(NV,NumTrees);
T=cell(1,NumTrees);

parfor i=1:NumTrees
T{i}=fitctree(TrainFeatures,TrainingData.data(:,1),'Prior','empirical','MinLeafSize',5,'NumVariablesToSample',50,'MaxNumCategories',857);
T{i}=compact(prune(T{i}));
end

j=1;while j<=NumTrees
    
newprediction=zeros(NV,1);

tic;
parfor i=1:NV
    
    newprediction(i,1)=predict(T{j},ValidFeatures(i,:));

end
toc;

prediction(:,j)=newprediction;

j=j+1;
end

predictionfile=fopen('prediction.csv','w+');

i=1;
while i<=NV
    
    fprintf(predictionfile,'%d,%d\n',mode(prediction(i,:)),PredictCountry(mode(prediction(i,:))));  
i=i+1;
end

fclose(predictionfile);