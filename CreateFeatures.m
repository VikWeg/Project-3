N=length(TrainingData.textdata);
TrainingFeatures=cell(N,1);

tic;
parfor i = 1:N
    
        TrainingFeatures(i)={CreateBagScores(lower(TrainingData.textdata{i}),representatives)};       

%        WordsInCityName=strsplit(CityName);
        
%         FeatureVector1(i)=length(CityName);                         % Number of Letters in CityName
%         FeatureVector2(i)=length(WordsInCityName);                  % Number of Words in CityName
%         FeatureVector3(i)=max(cellfun(@length,WordsInCityName));    % Maximum WordLength in CityName  
%         FeatureVector4(i)=min(cellfun(@length,WordsInCityName));    % Minimum WordLength in CityName  
%         FeatureVector5(i)=[1 1];% 
end
toc;
%TrainingFeatureVector=[FeatureVector1' FeatureVector2' FeatureVector3' FeatureVector4' FeatureVector5'];

clear N FeatureVector1 FeatureVector2 FeatureVector3 FeatureVector4 FeatureVector4


% N=height(ValidationData);
% 
% parfor i = 1:N
%     
%         clc
%         disp(i)
%         
%         CityName=ValidationData{i,1}{1};
%         WordsInCityName=strsplit(CityName);
%         
%         FeatureVector1(i)=length(CityName);                         % Number of Letters in CityName
%         FeatureVector2(i)=length(WordsInCityName);                  % Number of Words in CityName
%         FeatureVector3(i)=max(cellfun(@length,WordsInCityName));    % Maximum WordLength in CityName  
%         FeatureVector4(i)=min(cellfun(@length,WordsInCityName));    % Minimum WordLength in CityName 
% end
% 
% ValidationFeatureVector=[FeatureVector1' FeatureVector2' FeatureVector3' FeatureVector4'];
% 
% clear N FeatureVector1 FeatureVector2 FeatureVector3 FeatureVector4
