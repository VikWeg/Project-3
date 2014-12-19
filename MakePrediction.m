
NV=length(ValidationData);
newpredictions=zeros(NV,1);
tic;
parfor i=1:NV
    
    %pred=predict(A,ValidationFeatureVector(i,1:857));
    %predictions(i)=str2double(pred{1});

    newprediction(i)=predict(A,ValidFeatures(i,:));
    %predictions(i)=predict(A,ValidFeatures(i,:));
end
toc;
 
i=1;
while i<=NV
    predictions(i)= {[predictions{i} newprediction(i)]};
i=i+1;
end

predictionfile=fopen('prediction.csv','w+');

i=1;
while i<=NV
    
    fprintf(predictionfile,'%d,%d\n',mode(predictions{i}),PredictCountry(mode(predictions{i})));  
i=i+1;
end

fclose(predictionfile);