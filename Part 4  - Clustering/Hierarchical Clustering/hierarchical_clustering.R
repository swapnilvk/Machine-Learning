#Hierarchical clustering 

#importing dataset 
dataset = read.csv('Mall_Customers.csv')
X = dataset[4:5] 

#Using Dedtrogram to find optimal number of clusters 
dendrogram = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab='Euclidean Distances')

#Fitting Hierarchical clustering to dataset
hc = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
y_hc = cutree(hc,5)

#Visualizing the cluster
#install.packages("cluster")
library(cluster)
clusplot(X, 
         y_hc,
         lines=0,
         shade=TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span=TRUE,
         main=paste("Cluster of clients"),
         xlab="Anual inclome",
         ylab = "Spending score")