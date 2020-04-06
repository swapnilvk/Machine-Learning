#Polynomial Regression

#@author: Swapnil Vivek Kulkarni

#importing dataset 
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#Fitting linear regression model to dataset
lin_reg = lm(formula = Salary ~ .,
             data=dataset)

#Fitting Polynomial regression model to dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
poly_reg = lm(formula = Salary ~ .,
              data= dataset) #Salary ~ . means Salary vs all other variables 

#Visualizing Liniear regression results 
#install.packages('ggplot2')
library(ggplot2)

ggplot()+
  geom_point(aes(x = dataset$Level, y =dataset$Salary),
             colour = 'red')+
  geom_line(aes(x=dataset$Level, y=predict(lin_reg,newdata = dataset)),
            colour ='blue')+
  ggtitle('Truth vs Bluff(Linear Regression)')+
  xlab('Level')+
  ylab('Salary')

#Visualizing Polynomial regression results
ggplot()+
  geom_point(aes(x = dataset$Level, y =dataset$Salary),
             colour = 'red')+
  geom_line(aes(x=dataset$Level, y=predict(poly_reg,newdata = dataset)),
            colour ='blue')+
  ggtitle('Truth vs Bluff(Polynomial Regression)')+
  xlab('Level')+
  ylab('Salary')

