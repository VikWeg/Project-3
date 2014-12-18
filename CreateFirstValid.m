FirstValid='02 qyserqw wxrbxx pnaqfn';

FirstValidFeatures={CreateBagScores(FirstValid,representatives)};

FirstValidFeatureVector=[FirstValidFeatures{1}{:}];

FirstValidCity=predict(B,FirstValidFeatureVector);

FirstValidCountry=PredictCountry(FirstValidCity);