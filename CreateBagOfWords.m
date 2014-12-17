%% Maximum number of words in a city name
% CityNamesSplitInWords=cellfun(@strsplit,TrainingData.textdata,'UniformOutput',false);
% NumberOfWordsInACitysName=cellfun(@length,CityNamesSplitInWords);
% MaxNumOfWordsInACitysName=max(cell2mat(NumberOfWordsInACitysName));


N=length(TrainingData.textdata);

BagOfWords=zeros(N,length(Dictionary));

i=1;while i<=N
    words=strsplit(TrainingData.textdata{i});
    disp(i)
    j=1;while j<= length(Dictionary)
           
            container=zeros(1,length(words));
            k=1;while k<=length(words)
                
                    if length(Dictionary{j}) > length(words{k})
                    container(k)=isempty(strfind(Dictionary{j},lower(words{k})));
                    else
                     container(k)=isempty(strfind(lower(words{k}),Dictionary{j}));   
                    end
                k=k+1; 
                end
            
            if sum(container)>0
                BagOfWords(i,j)=1;
            else
                BagOfWords(i,j)=0;
            end
        j=j+1;  
        end
    i=i+1;   
    end
                
                