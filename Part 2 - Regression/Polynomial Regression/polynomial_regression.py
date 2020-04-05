# -*- coding: utf-8 -*-
"""
Created on Sun Mar 29  2020

@author: Swapnil Vivek Kulkarni
"""
#Importing libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Import dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:,1:2].values
Y = dataset.iloc[:,2].values

#Fitting Linear regression in to dataset 
from sklearn.linear_model import LinearRegression
lin_reg = LinearRegression()
lin_reg.fit(X, Y)

#Fitting Polynimial regression in to dataset
from sklearn.preprocessing import PolynomialFeatures
poly_reg = PolynomialFeatures()
X_poly = poly_reg.fit_transform(X)
lin_reg_2 = LinearRegression()
lin_reg_2.fit(X_poly, Y)

#Visualizing Linear regression results
plt.scatter(X, Y, color = 'red')
plt.plot(X, lin_reg.predict(X),color='blue')
plt.title('Truth or bluff(Linear regression)')
plt.xlabel('Position level')
plt.xlabel('Salary')
plt.show()

#Visualizing polynomial regression results 
plt.scatter(X, Y, color = 'red')
plt.plot(X, lin_reg_2.predict(poly_reg.fit_transform(X)),color='blue')
plt.title('Truth or bluff(Linear regression)')
plt.xlabel('Position level')
plt.xlabel('Salary')
plt.show()

#predict new result with Linear Regression
lin_reg.predict(np.array([6.5]).reshape(1, 1))
#predict new result with Polynomial Regression
lin_reg_2.predict(poly_reg.fit_transform(np.array([6.5]).reshape(1, 1)))