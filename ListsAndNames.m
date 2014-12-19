%% Country codes, city codes, a city's names
% List all possible country and city codes
% List all city names associated with a city code
% (might include wrong assignments)

countrycodes=unique(TrainingData.data(:,2));
citycodes=unique(TrainingData.data(:,1));

ACitysNames=cell(857,857);
 i=1;while i<=857
     
        OneCity=find(TrainingData.data(:,1)==citycodes(i));
        ACitysNames(1:length(OneCity),i)=TrainingData.textdata(OneCity);
    i=i+1;
    end 
%% A country's city codes
% List all city codes associated with a country
 
%  ACountrysCities=zeros(857,189);
%  i=1;while i<=189
%      
%         OneCountry=find(TrainingData.data(:,2)==countrycodes(i));
%         ACountrysCities(1:length(unique(TrainingData.data(OneCountry))),i)=unique(TrainingData.data(OneCountry));
%     i=i+1;
%     end
%% A country's city names
% List all city names of one country

% ACountrysCityNames=cell(5000,189);
% ACountrysCityNames(:,:)=cellstr('BLANK');
% i=1;while i<=189
%         OneCountry=find(TrainingData.data(:,2)==countrycodes(i));
%         ACountrysCityNames( 1:length(TrainingData.textdata(OneCountry)) , i )=TrainingData.textdata(OneCountry);
%     i=i+1;    
%     end
%     

%% Dictionary
% List all possible words over all countries,
% including all varieties (capitaliztation, etc.)


% AllWords=cell(length(TrainingData.textdata),50);
% AllWords(:,:)= cellstr('BLANK');
% 
% i=1;while i<=length(TrainingData.textdata)
%        CurrentCityName=TrainingData.textdata(i);
%        AllWords( i , 1:length( strsplit(CurrentCityName{1}) ) )= strsplit(CurrentCityName{1});
%     i=i+1;
%     end
%  
% Dictionary=unique(lower(AllWords));
%% Alphabet
%List all possible characters over all countries
 
% AllLetters=cell(length(Dictionary),45);
% AllLetters(:,:)= cellstr('BLANK');
% 
% i=1;while i<=length(Dictionary)
%        CurrentWord=Dictionary{i};
%        AllLetters( i , 1:length(CurrentWord) )= cellstr(CurrentWord(:))';
%     i=i+1;
%     end
%     
% Alphabet=unique(AllLetters);

%% A country's dictionary
%List all possible words for one country
 
% AllWords=cell(length(TrainingData.textdata),25);
% 
% CountryDictionaries=cell(18121,189);
% CountryDictionaries(:,:)=cellstr('BLANK');
% 
% n=1;while n<=189
%     
%         AllWords(:,:)= cellstr('BLANK');
%     
%         i=1;while ~strcmp('BLANK',ACountrysCityNames(i,n))
%                CurrentCityName=ACountrysCityNames(i,n);
%                AllWords( i , 1:length( strsplit(CurrentCityName{1}) ) )= strsplit(CurrentCityName{1});
%             i=i+1;
%             end
% 
%         uniqueWords=unique(AllWords);
%         CountryDictionaries(1:length(uniqueWords),n)=uniqueWords;
%         n=n+1;
%    end

%% A country's alphabet
%List all possible characters for one country

% AllLetters=cell(length(TrainingData.textdata),66);
% 
% CountryAlphabets=cell(66,189);
% CountryAlphabets(:,:)=cellstr('BLANK');
% 
% n=1;while n<=189
%     
%         AllLetters(:,:)= cellstr('BLANK');
%     
%         i=1;while ~strcmp('BLANK',CountryDictionaries(i,n)) || ~strcmp('BLANK',CountryDictionaries(i+1,n))
%                if ~strcmp('BLANK',CountryDictionaries(i,n))
%                 CurrentWord=CountryDictionaries{i,n};
%                 AllLetters( i , 1:length(CurrentWord) )= cellstr(CurrentWord(:))';
%                end
%             i=i+1;
%             end
% 
%         uniqueLetters=unique(AllLetters);
%         CountryAlphabets(1:length(uniqueLetters),n)=uniqueLetters;
%         n=n+1;
%     end

%% Dictionary Overlap
%How many words from a country's dictionary a contained in each of the
%other dictionaries?

% OverlapMatrix=zeros(189,189);
% 
% i=1;while i<=189
%     j=i;while j<=189
%         OverlapMatrix(i,j)=length(intersect(CountryDictionaries(:,i),CountryDictionaries(:,j)))-1;
%         j=j+1;
%         end
%     i=i+1;
%     end
    
%% Alphabet Overlap
    
%     AlphabetOverlapMatrix=zeros(189,189);
% 
% i=1;while i<=189
%     j=i;while j<=189
%         AlphabetOverlapMatrix(i,j)=length(intersect(CountryAlphabets(:,i),CountryAlphabets(:,j)))-1;
%         j=j+1;
%         end
%     i=i+1;
%     end


