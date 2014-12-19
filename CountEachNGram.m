function NGramCounts = CountEachNGram(CityName,NGrams)

NA=length(NGrams);
NGramCounts=zeros(1,NA);

if length(CityName)>=length(NGrams{1})
    
    i=1;
    while i<=NA
    NGramCounts(i)=length(strfind(CityName,NGrams{i}));
    i=i+1;
    end

end

end