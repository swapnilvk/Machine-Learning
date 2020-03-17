# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#importing dataset
dataset = pd.read_csv("Data.csv")
X = dataset.iloc[:,:-1].values
Y = dataset.iloc[:,3].values

#Taking care of missing data
from sklearn.preprocessing import Imputer #use ctl+I to see function help in Spyder
imputer = Imputer(missing_values='NaN', strategy ='mean', axis = 0)
imputer = imputer.fit(X[:,1:3])
X[:,1:3] = imputer.transform(X[:,1:3])


