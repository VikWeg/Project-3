% citycodes=unique(TrainingData.data(:,1));
% 
% ACitysNames=cell(857,857);
%  i=1;while i<=857
%      
%         OneCity=find(TrainingData.data(:,1)==citycodes(i));
%         
%         uniqueCityNames=unique(lower(TrainingData.textdata(OneCity)));
%         
%         ACitysNames(1:length(uniqueCityNames),i) = uniqueCityNames;
%         
%     i=i+1;
%     end
%     
% AllWords=cell(length(TrainingData.textdata),19);
% 
% CityDictionaries=cell(178,857); %max number of unique words per city is 178
% CityDictionaries(:,:)=cellstr('');
% 
% n=1;while n<=857
%     
%         AllWords(:,:)= cellstr('');
%     
%         i=1;while ~isempty(ACitysNames{i,n})
%             
%                CurrentCityName=ACitysNames(i,n);
%                CurrentWords=strsplit(CurrentCityName{1});
%                
%                AllWords( i , 1:length( CurrentWords ) )= CurrentWords;
%             i=i+1;
%             end
% 
%        uniqueWords=unique(AllWords);
%        CityDictionaries(1:length(uniqueWords),n)=uniqueWords;
%         n=n+1;
% end
% 
% CityDictionaries(1,:)=[];
% 
%  TempCityDictionaries=CityDictionaries;
% 
% bags=cell(857,178,178);
% bags(:,:,:)=cellstr('');
% i=1;while i<=857
%    tic;disp(i) 
%     j=1;while j<=178 && ~strcmp(TempCityDictionaries{j,i},'')
%             if ~strcmp(TempCityDictionaries{j,i},'DONE')
%                 if j==1
%                     jtemp=1;
%                 end
%                    CurrentWord=TempCityDictionaries{j,i};
%                    crit=sqrt(length(CurrentWord));
%                    bags(i,jtemp,1)=TempCityDictionaries(j,i);
%                    TempCityDictionaries(j,i)=cellstr('DONE');
%                    
%                    k=j+1;entered=0;
%                    while k<=178 && ~strcmp(TempCityDictionaries{k,i},'')
%                         if fastlevenstein(TempCityDictionaries{k,i},CurrentWord)<= crit+1
%                             if entered==0
%                                 ktemp=2;
%                             end
%                         bags(i,jtemp,ktemp)=TempCityDictionaries(k,i);
%                         TempCityDictionaries(k,i)=cellstr('DONE');
%                         ktemp=ktemp+1;
%                         entered=1;
%                        end
%                   k=k+1;
%                   end
%             jtemp=jtemp+1;
%             
%             end
%         j=j+1;
%         end
%     i=i+1;toc;
%     end
representatives=cell(1,857);

i=1;while i<=857
    nonempty=sum(cellfun(@(x) ~strcmp(x,''),bags(i,:,1)));
    representatives(i)={bags(i,1:nonempty,1)'};
    i=i+1;
end
