#Apriori Algorithm
#@Author: Swapnil Vivek Kulkarni

#Data preprocessing 
#install.packages('arules')
library(arules)

dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)

#Read all the transactions in sparce matrix
dataset = read.transactions('Market_Basket_Optimisation.csv', sep=',', rm.duplicates = TRUE)
summary(dataset)

#Plot top 10 highest purchased products from dataset 
itemFrequencyPlot(dataset,topN=10)

#Training Apriori on dataset
#Support calculated by 3*7/7500 = 0.0028 where as procuct purchased atleast three times per day within entire 7500 customers
#Confidence is 40%
rules = apriori(data=dataset, parameter = list(support=0.0028, confidence=0.4))

#visualizing the result 
inspect(sort(rules, by='lift')[1:10])