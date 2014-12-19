N=length(TrainingData.textdata);
TrainingFeatures=cell(N,1);

%% Dictionary
% List all possible words over all countries,
% including all varieties (capitaliztation, etc.)

% 
% AllWords=cell(length(TrainingData.textdata),50);
% AllWords(:,:)= cellstr('BLANK');
% 
% i=1;while i<=length(TrainingData.textdata)
%        CurrentCityName=TrainingData.textdata(i);
%        AllWords( i , 1:length( strsplit(CurrentCityName{1}) ) )= strsplit(CurrentCityName{1});
%     i=i+1;
%     end
%  
% Dictionary=unique(lower(AllWords));
%% Alphabet
%List all possible characters over all countries
 
% AllLetters=cell(length(Dictionary),45);
% AllLetters(:,:)= cellstr('BLANK');
% 
% i=1;while i<=length(Dictionary)
%        CurrentWord=Dictionary{i};
%        AllLetters( i , 1:length(CurrentWord) )= cellstr(CurrentWord(:))';
%     i=i+1;
%     end
%     
% Alphabet=unique(AllLetters);
% Alphabet(17)=[];

%% Build Features
tic;
parfor i = 1:N
    
      %  TrainingFeatures(i)={CreateBagScores(lower(TrainingData.textdata{i}),representatives)};
      CityName=lower(TrainingData.textdata{i});
      CityWords=strsplit(CityName);
      
      f1 = length(CityName);
      f2 = length(CityWords);
      f3 = max(cellfun(@length,CityWords));
      f4 = min(cellfun(@length,CityWords));
      f5 = median(cellfun(@length,CityWords));
      
      f6 = CountEachLetter(CityName,Alphabet);
      
      TrainingFeatures(i)={[f1 f2 f3 f4 f5 f6]};
      
    
end
toc;

NumFeatures=length(TrainingFeatures{1});

TrainFeatures=zeros(N,NumFeatures);
i=1;
while i<=N
    TrainFeatures(i,1:NumFeatures)=TrainingFeatures{i};
    i=i+1;
end


N=length(ValidationData);

tic;
parfor i = 1:N
    
        %ValidationFeatures(i)={CreateBagScores(lower([ValidationData{i,1}{:}]),representatives)};
      CityName=lower(ValidationData{i});
      CityWords=strsplit(CityName);
      
      f1 = length(CityName);
      f2 = length(CityWords);
      f3 = max(cellfun(@length,CityWords));
      f4 = min(cellfun(@length,CityWords));
      f5 = median(cellfun(@length,CityWords));
      
      f6 = CountEachLetter(CityName,Alphabet);
      
      ValidationFeatures(i)={[f1 f2 f3 f4 f5 f6]};
end
toc;

ValidFeatures=zeros(N,NumFeatures);
i=1;
while i<=N
    ValidFeatures(i,1:NumFeatures)=ValidationFeatures{i};
    i=i+1;
end
