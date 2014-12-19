
% %% Dictionary
% % List all words (converted to lower case) that occur in TrainingData


AllWords=cell(length(TrainingData.textdata),50);
AllWords(:,:)= cellstr('BLANK');

i=1;while i<=length(TrainingData.textdata)
       CurrentCityName=TrainingData.textdata(i);
       AllWords( i , 1:length( strsplit(CurrentCityName{1}) ) )= strsplit(CurrentCityName{1});
    i=i+1;
    end
 
Dictionary=unique(lower(AllWords));
%% Alphabet
%List all lower-case characters that occur in TrainingData
 
AllLetters=cell(length(Dictionary),45);
AllLetters(:,:)= cellstr('BLANK');

i=1;while i<=length(Dictionary)
       CurrentWord=Dictionary{i};
       AllLetters( i , 1:length(CurrentWord) )= cellstr(CurrentWord(:))';
    i=i+1;
    end
    
Alphabet=unique(AllLetters);
Alphabet(17)=[];

%% Build Features
% Every CityName is assigned a numeric Feature vecotr of length NumFeatures

N=length(TrainingData.textdata);
TrainingFeatures=cell(N,1);

TwoGrams={' #',' t','et','ge','hd','mg','my','nj','nx','pf','pl','pm','q-','qo','qq','yl',...
    'xf',' o','ir',' c',' d','bx','by','cm','dx','fb','fn','fq','mb','mq','na','nb','qa','qb','qf','qi','qs','se','wb','xx'};
% i=1;
% while i<=10
% TwoGrams{i}=datasample([Alphabet{17:end}],2);
% i=i+1;
% end
% TwoGrams=unique(TwoGrams);

% ThreeGrams=cell(10,1);
% i=1;
% while i<=10
% ThreeGrams{i}=datasample([Alphabet{17:end}],3);
% i=i+1;
% end
% ThreeGrams=unique(ThreeGrams);

tic;
parfor i = 1:N
    
      CityName=lower(TrainingData.textdata{i});         % Get i-th CityName
      CityWords=strsplit(CityName);                     % Extract the words of CityName
      
      f1 = length(CityName);                            % Number of letters in CityName
      f2 = length(CityWords);                           % Number of words in CityName
      f3 = max(cellfun(@length,CityWords));             % Maximum word-length in CityName
      f4 = min(cellfun(@length,CityWords));             % Minimum word-length in CityName
      f5 = median(cellfun(@length,CityWords));          % Median word-length in CityName
      %f6 = sum(isstrprop(CityName,'upper'));            % Number of upper-case letters in CityName
      f6= CountEachNGram(CityName,TwoGrams);
      f7 = CountEachLetter(CityName,Alphabet);          % This feature contains a number of "length(Alphabet)" subfeatures.
      %f8= CountEachNGram(CityName,ThreeGrams);                                        % It lists how often a particular letter is contained in CityName.
                      
      
      TrainingFeatures(i)={[f1 f2 f3 f4 f5 f6 f7]};     % Merge features together
      
    
end
toc;

NumFeatures=length(TrainingFeatures{1});                % Total length of feature vector

TrainFeatures=zeros(N,NumFeatures);
i=1;
while i<=N
    TrainFeatures(i,1:NumFeatures)=TrainingFeatures{i}; % Convert cell array to numeric array
    i=i+1;
end

%% Create Validation Features
% Analogous to Training Features

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
      %f6 = sum(isstrprop(CityName,'upper'));
      f6= CountEachNGram(CityName,TwoGrams);
      f7 = CountEachLetter(CityName,Alphabet);
      %f8= CountEachNGram(CityName,ThreeGrams);  
      
      ValidationFeatures(i)={[f1 f2 f3 f4 f5 f6 f7]};
end
toc;

ValidFeatures=zeros(N,NumFeatures);
i=1;
while i<=N
    ValidFeatures(i,1:NumFeatures)=ValidationFeatures{i};
    i=i+1;
end
