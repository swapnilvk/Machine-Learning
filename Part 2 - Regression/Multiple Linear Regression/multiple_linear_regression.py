# -*- coding: utf-8 -*-
"""
Created on Wed Mar 25 2020

@author: Swapnil Kulkarni
"""
#Multiple Linear regression

#Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Imporing the dataset 
dataset = pd.read_csv('50_Startups.csv') 
X = dataset.iloc[:,:-1].values # : means all elements
Y = dataset.iloc[:,4].values

#Encoding categorical data
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_X = LabelEncoder()
X[:,3] = labelencoder_X.fit_transform(X[:,3])
onehotencoder = OneHotEncoder(categorical_features=[3])
X = onehotencoder.fit_transform(X).toarray()

#Avoiding Dummy variable trap
X = X[:,1:] #Always omit one dummy variable

#splitting the dataset into training set and test set
from sklearn.model_selection import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.2, random_state=0)

#Fitting multiple linear regression into traing set
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, Y_train)

#Predecting the test set results
Y_pred = regressor.predict(X_test)
    
#Building optimal model using backword elemination
import statsmodels.formula.api as sm
X = np.append(arr = np.ones((50,1)).astype(int), values=X, axis = 1)
X_opt = X[:,[0,1,2,3,4,5]]
regressor_OLS = sm.OLS(endog=Y, exog=X_opt).fit()
regressor_OLS.summary()

X_opt = X[:,[0,1,3,4,5]]
regressor_OLS = sm.OLS(endog=Y, exog=X_opt).fit()
regressor_OLS.summary()

X_opt = X[:,[0,3,4,5]]
regressor_OLS = sm.OLS(endog=Y, exog=X_opt).fit()
regressor_OLS.summary()

X_opt = X[:,[0,3,5]]
regressor_OLS = sm.OLS(endog=Y, exog=X_opt).fit()
regressor_OLS.summary()

X_opt = X[:,[0,3]]
regressor_OLS = sm.OLS(endog=Y, exog=X_opt).fit()
regressor_OLS.summary()