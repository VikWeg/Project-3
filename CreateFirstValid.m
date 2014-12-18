FirstValid='02 qyserqw wxrbxx pnaqfn';

FirstValidFeatures={CreateBagScores(FirstValid,representatives)};

FirstValidFeatureVector=[FirstValidFeatures{1}{:}];

FirstValidCity=predict(C,FirstValidFeatureVector);
%str2num(FirstValidCity{1})
FirstValidCountry=PredictCountry(FirstValidCity);