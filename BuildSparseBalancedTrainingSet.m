
N=length(TrainingData.textdata);
SparseTrainingFeatures=(TrainingFeatureVector>=2).*TrainingFeatureVector;
citycodes=unique(TrainingData.data(:,1));

SamplesPerCity=10;

SparseBalancedTrainingSet=zeros(SamplesPerCity*857,857+1);

i=1;
while i<=857
    
   CurrentCityIndices=find(TrainingData.data(:,1)==citycodes(i));
   
   j=SamplesPerCity*(i-1)+1;
   while j<=SamplesPerCity*i
       draw=randsample(CurrentCityIndices,1);
       SparseBalancedTrainingSet(j,1:858)=[SparseTrainingFeatures(draw,:) TrainingData.data(draw,1)];
       j=j+1;
   end
   
  i=i+1; 
end

ShuffledIndices=randperm(SamplesPerCity*857);
SparseBalancedTrainingSet=SparseBalancedTrainingSet(ShuffledIndices,:);

NB=length(SparseBalancedTrainingSet);