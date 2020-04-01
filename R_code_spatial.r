# R code for spatial view of points

library(sp) # on the top of the script install/call all the packages needed as usual
data(meuse) # same for the dataset
head(meuse) # exploring the dataset also with summary() etc

#coordinates
coordinates(meuse) = ~ x+y

plot(meuse) # simple plotting of x,y

spplot(meuse , "zinc") # plotting with related legend an colors

# Exercise: plot spatial amount of copper
spplot(meuse, "copper", main= "Copper concentration") # main= "Main title" also use tab for all the arguments

bubble(meuse, "zinc") # size of the bubbles instead of colors

#Excercise: bubble copper in red
bubble(meuse, "copper", col="red", main= "Copper conc.") # use ?bubble or tab for the arguments

### Importing new data
# donwload covid_agg.csv dataset from iol and put it in the new "lab" directory
# set working directory
# setwd("C:/lab/")  windows
setwd("~/Sgn/Monitoring ecosystems changes and functioning/lab") # in this case the directory is in
# C:\Users\igord\Documents\Sgn\Monitoring ecosystems changes and functioning\lab

covid <- read.table("covid.agg.csv", head=TRUE, sep= " ") # it is al little tricky as in this case the separator is space
# you could also re-save the csv with the default sep

# always explore the data
head(covid)
?attach
attach(covid)

plot(country,cases)

#plot(covid$country, covid$cases)

#labels
plot(covid$country, covid$cases, las = 0) # parallel
plot(covid$country, covid$cases, las = 1) # horizontal
plot(covid$country, covid$cases, las = 2) # perpendicular
plot(covid$country, covid$cases, las = 3) # vertical

plot(covid$country, covid$cases, las = 3, cex.axis = 0.5, xlab = "") 

# install.packages(ggplot2) it is already installed so no need for this
library(ggplot2) 

data(mpg)
ggplot(mpg, aes(x = displ, y = hwy)) +
        geom_point()

# save the .RData under the file menu for next lecture
