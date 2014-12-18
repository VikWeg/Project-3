
N=length(TrainingData.textdata);
TrainingFeatureVector=importdata('C:\ETH\Lectures\MATLAB\MachineLearning\TrainingFeatures.csv');
ValidationFeatureVector=importdata('C:\ETH\Lectures\MATLAB\MachineLearning\ValidationFeatures.csv');
citycodes=unique(TrainingData.data(:,1));

SamplesPerCity=50;

BalancedTrainingSet=zeros(SamplesPerCity*857,857+1);

i=1;
while i<=857
    
   CurrentCityIndices=find(TrainingData.data(:,1)==citycodes(i));
   
   j=SamplesPerCity*(i-1)+1;
   while j<=SamplesPerCity*i
       draw=randsample(CurrentCityIndices,1);
       BalancedTrainingSet(j,1:858)=[TrainingFeatureVector(draw,:) TrainingData.data(draw,1)];
       j=j+1;
   end
   
  i=i+1; 
end

ShuffledIndices=randperm(SamplesPerCity*857);
BalancedTrainingSet=BalancedTrainingSet(ShuffledIndices,:);

NB=length(BalancedTrainingSet);