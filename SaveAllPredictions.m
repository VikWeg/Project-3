
allpredictions=zeros(length(predictions),length(predictions{1}));
i=1;
while i<=NV
    allpredictions(i,1:length(predictions{1}))=predictions{i};
i=i+1;
end


save allpredictions.csv allpredictions -ASCII