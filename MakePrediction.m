
clear predictions
NV=height(ValidationData);
predictions=zeros(NV,1);
tic;
parfor i=1:NV
    
    %pred=predict(A,ValidationFeatureVector(i,1:857));
    %predictions(i)=str2double(pred{1});
    predictions(i)=predict(C,ValidationFeatureVector(i,1:857));
end
toc;
 
predictionfile=fopen('prediction.csv','w+');

i=0;
while i<=height(ValidationData)
    if i==0
        fprintf(predictionfile,'%d,%d\n',FirstValidCity,FirstValidCountry);
        
    else
        %str2num(predictions{i})
        fprintf(predictionfile,'%d,%d\n',predictions(i),PredictCountry(predictions(i)));  
    end
    i=i+1;
end

fclose(predictionfile);