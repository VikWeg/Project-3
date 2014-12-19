global ValidationData
validID=fopen('C:\ETH\Lectures\Exercises\MachineLearning\Project 3\validation.csv');
ValidationData=textscan(validID,'%s','Delimiter','\n');
ValidationData=ValidationData{1};
fclose(validID);
global TestData
TestData=importdata('C:\ETH\Lectures\Exercises\MachineLearning\Project 3\testing.csv');
global TrainingData
TrainingData=importdata('C:\ETH\Lectures\Exercises\MachineLearning\Project 3\training.csv');