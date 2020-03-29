#Created on Sun Mar 29 2020
#@author: Swapnil Vivek Kulkarni

#Multiple Linear regression

#import dataset
dataset = read.csv('50_Startups.csv')

#Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3)) #C() is nothing but vector in R
#Spliting dataset into Training set and Test set 
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit,SplitRatio = 0.8)
training_set = subset(dataset,split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting multiple linear regresson in to Training set
regressor = lm(formula = Profit ~ .,
               data = training_set) #. means all the independeant columns

#Predict testset results
y_pred = predict(regressor,newdata = test_set)

#Building optimal model usingbackword elimination
regressor = lm(formula =  Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
              data = dataset)
summary(regressor)

regressor = lm(formula =  Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset)
summary(regressor)

regressor = lm(formula =  Profit ~ R.D.Spend,
               data = dataset)
summary(regressor)