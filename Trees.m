function assignment = root(NewCityName)

global TrainingData

OneToOneMatches=find(strcmp(NewCityName,TrainingData.textdata)==1);

if isempty(OneToOneMatches)
   assignment=0;
else
    [~,~,EquallyFrequentCountries]=mode(TrainingData.data(OneToOneMatches,2));
    
    if length(EquallyFrequentCountries) > 1
        assignment=-1;
    else
        [MostFrequentCity,~,EquallyFrequentCities]=mode(TrainingData.data(OneToOneMatches,1));
        
        if length(EquallyFrequentCities) > 1
            assignment=-2;
            
        else
            assignment=MostFrequentCity;
        end
    end
end
    
end

