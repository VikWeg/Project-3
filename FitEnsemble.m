
citycodes=unique(TrainingData.data(:,1));

priors=zeros(length(citycodes),1);
parfor i = 1:length(citycodes)
priors(i)=length(find(citycodes(i)==TrainingData.data(:,1)))/length(TrainingData.data(:,1));
end
tic;
A = fitensemble(TrainFeatures,TrainingData.data(:,1),'Bag',2,'Tree','Type','classification','ClassNames',citycodes,'Prior',priors);
toc;