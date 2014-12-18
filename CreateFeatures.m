% N=length(TrainingData.textdata);
% TrainingFeatures=cell(N,1);
% 
% tic;
% parfor i = 1:N
%     
%         TrainingFeatures(i)={CreateBagScores(lower(TrainingData.textdata{i}),representatives)};       
% end
% toc;


% N=height(ValidationData);
% 
% tic;
% parfor i = 1:N
%     
%         ValidationFeatures(i)={CreateBagScores(lower([ValidationData{i,1}{:}]),representatives)};       
% end
% toc;

ValidationFeatureVector=zeros(N,857);
i=1;while i<=N
    ValidationFeatureVector(i,1:857)=[ValidationFeatures{i}{:}];
    i=i+1;
end
