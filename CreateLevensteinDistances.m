
N=length(TrainingData.textdata);
LevenSteinDistances=zeros(1,N);

parfor i=1:N-1
    LevenSteinDistances(i)=levenstein(TrainingData.textdata{i},TrainingData.textdata{i+1});
end

LevenSteinDistances=cumsum(LevenSteinDistances);