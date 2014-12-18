
% N=length(TrainingData.textdata);
% TrainingFeatureVector=importdata('C:\ETH\Lectures\MATLAB\MachineLearning\TrainingFeatures.csv');
% 
% citycodes=unique(TrainingData.data(:,1));
% 
% BalancedTrainingSet=zeros(40*857,857+1);
% 
% i=1;while i<=857
%     
%    CurrentCityIndices=find(TrainingData.data(:,1)==citycodes(i));
%    
%    j=40*(i-1)+1;while j<=40*i
%        draw=randsample(CurrentCityIndices,1);
%        BalancedTrainingSet(j,1:858)=[TrainingFeatureVector(draw,:) TrainingData.data(draw,1)];
%        j=j+1;
%    end
%    
%   i=i+1; 
% end
% 
% ShuffledIndices=randperm(40*857);
% BalancedTrainingSet=BalancedTrainingSet(ShuffledIndices,:);
% 
% NB=length(BalancedTrainingSet);
%clear predictions

%B=TreeBagger(1,TrainingFeatureVector(101:N,:),TrainingData.data(101:N,1));

%,'CrossVal','off','KFold',2
% tic;
% B=fitctree(BalancedTrainingSet(501:NB,1:857),BalancedTrainingSet(501:NB,858));
% toc;

% predictions=zeros(height(ValidationData),1);
% tic;
% parfor i=1:height(ValidationData)
% 
%     predictions(i)=predict(B,ValidationFeatureVector(i,1:857));
%     
% end
% toc;
 
%predictions=cellfun(@str2num,predictions)';
%sum(predictions'~=TrainingData.data(ShuffledIndices(1:100),1))

predictionfile=fopen('prediction.csv','w+');

i=0;while i<=height(ValidationData)
    if i==0
        fprintf(predictionfile,'%d,%d\n',FirstValidCity,FirstValidCountry);
    else
        fprintf(predictionfile,'%d,%d\n',predictions(i),PredictCountry(predictions(i)));  
    end
    i=i+1;
end

fclose(predictionfile);