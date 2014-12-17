% predictionfile=fopen('prediction.txt','w+');
% fclose(predictionfile);
% N=length(TrainingData.textdata);
% TrainingFeatureVector=importdata('C:\ETH\MatLabCode\MachineLearning\Project-3\TrainingFeatures.csv');

% TrainingFeatureVector=zeros(N,857);
% 
% i=1;while i<=N
%     TrainingFeatureVector(i,1:857)=[TrainingFeatures{i,1}{:}];
%     i=i+1;
% end

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
NB=length(BalancedTrainingSet);
clear predictions

% B=TreeBagger(1,TrainingFeatureVector(101:N,:),TrainingData.data(101:N,1));

% ,'CrossVal','off','KFold',2
% tic;
% B=fitctree(BalancedTrainingSet(101:NB,1:857),BalancedTrainingSet(101:NB,858));
% toc;

tic;
parfor i=1:100

    predictions(i)=predict(B,BalancedTrainingSet(i,1:857));
    
end
toc;
 
%predictions=cellfun(@str2num,predictions)';
sum(predictions'~=TrainingData.data(ShuffledIndices(1:100),1))

