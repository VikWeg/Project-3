function BagScores = CreateBagScores(CityName,BagRepresentatives)

WordsInCityName=strsplit(CityName);
BagScores=cell(1,857);
BagScores(:,:)={0};

i=1;
while i<= length(WordsInCityName)
   
    CurrentWord=WordsInCityName{i};
    crit=sqrt(length(CurrentWord));
    
    j=1;
    while j<=857
       
        CurrentBagRepresentatives=BagRepresentatives{j};
        
        k=1;
        while k<=length(CurrentBagRepresentatives)

            if fastlevenstein(CurrentBagRepresentatives{k},CurrentWord) <= crit+1
            BagScores(j)={BagScores{j}+1};
            end
       
        k=k+1;
        end
       
    j=j+1; 
    end
i=i+1;
end

end