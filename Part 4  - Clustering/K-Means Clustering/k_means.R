#K-Means Clustering 
#@Author: Swapnil Vivek Kulkarni

#Importing dataset 
dataset <- read.csv('Mall_Customers.csv')
X <- dataset[4:5]

# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(X, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

#Aplling K-Means to dataset
set.seed(29)
kmeans = kmeans(X, 5,iter.max = 300, nstart = 10)

#Visualizing the cluster
#install.packages("cluster")
library(cluster)
clusplot(X, 
         kmeans$cluster,
         lines=0,
         shade=TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span=TRUE,
         main=paste("Cluster of clients"),
         xlab="Anual inclome",
         ylab = "Spending score")