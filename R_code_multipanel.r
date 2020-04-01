### Multipanel in R: the second lecture of Monitoring ecosystems

#usually we put the packages needed on the top of the code so everyone can read them immediately
install.packages("sp")
install.packages("GGally")

library(sp) # require(sp) will also do the job
library(GGally) 

data(meuse) there is a dataset avaiable named meuse

attach(meuse)

# exercise: see the names of the variables and plot cadmium versus zinc
# there are two ways to see the names of the variables:

names(meuse)
head(meuse)
plot(cadmium, zinc, pch= 15, col= "red")

# exercise: make all the paiwis plots of the dataset
plot(x,cadmium)
plot(x,zinc)
plot...
#plot is not a good idea!!
pairs(meuse)
# in case you recieve the error:"the size is too large" just adapt the graph window with the mouse
pairs(~ cadmium + copper + lead + zinc, data=meuse)
pairs(meuse[,3:6])  #same graph,another tiping
# exercise: prettify this graph
pairs(meuse[,3:6], col="blue", pch=11, cex= 0.7)

# GGally will prettify the current graph
#library(GGally) usually done on the top of the script
ggpairs(meuse[,3:6])
# ?aes
# ggpairs(meuse[,3:6],aes(colour='cut' ) ) + theme_dark() trying some aestetics
