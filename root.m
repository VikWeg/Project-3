function [MostFrequentCity,Frequency] = root(NewCityName)

global TrainingData

ClosestMatches=find(levenstein(NewCityName,TrainingData.textdata)==1);

    if isempty(OneToOneMatches)
       MostFrequentCity=0;
       Frequency=0; % No one to one matches with NewCityName in TrainingData
    else
        NumberOfDifferentCountryCodes=length(unique(TrainingData.data(OneToOneMatches,2)));
        
        if NumberOfDifferentCountryCodes > 1 % OneToOneMatches belong to different countries (should not happen)
            MatchedCountryCodes=TrainingData.data(OneToOneMatches,2);
            NumberOfDifferentCountryCodes=length(unique(MatchedCountryCodes));
            
            if NumberOfDifferentCountryCodes > 1
                CountryCodeTable=tabulate(MatchedCountryCodes);
                CountryCodeCounts=CountryCodeTable(:,2);
                if sum(max(CountryCodeCounts)==CountryCodeCounts)>1
                    MostFrequentCity=-2;
                    Frequency=0;
                    % There is no majority of matching city codes
                else
                    [MostFrequentCity,Frequency]=mode(MatchedCountryCodes);
                    % There is a majority of city codes that match
                end
            else
                MostFrequentCity=unique(MatchedCityCodes);
                Frequency=length(MatchedCityCodes);
                % There is only one kind of city code involved in the
                % matches
            end
            
        else
        MatchedCityCodes=TrainingData.data(OneToOneMatches,1);    
        NumberOfDifferentCityCodes=length(unique(MatchedCityCodes));
            if NumberOfDifferentCityCodes > 1
                CityCodeTable=tabulate(MatchedCityCodes);
                CityCodeCounts=CityCodeTable(:,2);
                if sum(max(CityCodeCounts)==CityCodeCounts)>1
                    MostFrequentCity=-2;
                    Frequency=0;
                    % There is no majority of matching city codes
                else
                    [MostFrequentCity,Frequency]=mode(MatchedCityCodes);
                    % There is a majority of city codes that match
                end
            else
                MostFrequentCity=unique(MatchedCityCodes);
                Frequency=length(MatchedCityCodes);
                % There is only one kind of city code involved in the
                % matches
            end
        end
    end
end

