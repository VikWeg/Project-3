function LetterCounts = CountEachLetter(CityName,Alphabet)

NA=length(Alphabet);
LetterCounts=zeros(1,NA);

i=1;
while i<=NA
LetterCounts(i)=sum(Alphabet{i}==CityName);
i=i+1;
end