function CountryCode = PredictCountry(CityCode)

global TrainingData

MatchIndices=find(CityCode==TrainingData.data(:,1));

CountryCode=TrainingData.data(mode(MatchIndices),2);

end