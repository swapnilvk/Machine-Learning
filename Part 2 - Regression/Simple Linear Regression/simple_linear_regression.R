#Simple Linear Regression

#importing datset
dataset = read.csv('Salary_Data.csv')

#Splitting the dataset in to Traing set and Test set
# install.packages('caTools') 
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset,split == TRUE)
test_set = subset(dataset,split == FALSE)

#Fitting simple linear regression in to traing set
regressor = lm(formula = Salary ~ YearsExperience, 
               data = training_set)

#Predicting the Test set results
y_pred = predict(regressor,newdata = test_set)

#Visualizing the Training set results 
install.packages('ggplot2')
library(ggplot2)
ggplot()+
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary), 
             colour='red')+
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor,newdata = training_set)),
            colour='blue')+
  ggtitle('Salary Vs Experinece (Training set)')+
  xlab('Years of Experience')+
  ylab('Salary')

#Visualizing the Test set results 
install.packages('ggplot2')
library(ggplot2)
ggplot()+
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary), 
             colour='red')+
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor,newdata = training_set)),
            colour='blue')+
  ggtitle('Salary Vs Experinece (Test set)')+
  xlab('Years of Experience')+
  ylab('Salary')
  