#R_code_snow.r

# i created a project into the lab folder so the lab is already setted as wd
#setwd("~/lab/")
# setwd("/Users/utente/lab") #mac
# setwd("C:/lab/") # windows

#put github into your CV!!!

#R_code_snow.r

# rm(list = ls()) it good to start with a clear mind since
###project usually loads the old workspace 

install.packages("ncdf4")
library(ncdf4)
library(raster)

#load raster
# warning message for the datum and the image dimension
snowmay <- raster("c_gls_SCE_202005260000_NHEMI_VIIRS_V1.0.1.nc")

cl <- colorRampPalette(c("darkblue","blue","lightblue"))(100)

plot(snowmay, col=cl)
snowmay

# tricks to load a data sets

# i know it's to long but i like to have all my Unibo files into the same folder
setwd("~/Sgn/Monitoring ecosystems changes and functioning/lab/snow")

# slow manner to import the set
snow2000 <- raster("snow2000r.tif")
snow2005 <- raster("snow2005r.tif")
snow2010 <- raster("snow2010r.tif")
snow2015 <- raster("snow2015r.tif")
snow2020 <- raster("snow2020r.tif")

#pot with 2 rows and 3 coloumns
par(mfrow=c(2,3))

plot(snow2000, col=cl)
plot(snow2005, col=cl)
plot(snow2010, col=cl)
plot(snow2015, col=cl)
plot(snow2020, col=cl)
## almost 20 lines!!
##########
# trick for lazy people
?lapply

rlist <- list.files(pattern = "snow" )
rlist

# apply raster to rlist(list of all data)
import <- lapply(rlist,raster)

# stack of different images

snow.multitemp <- stack(import)
snow.multitemp

plot(snow.multitemp, col=cl)

# let's make a prediction

#### prof's code on iol
source("prediction.r")

par(mfrow=c(1,1))
plot(predicted.snow.2025, col=cl)
plot(predicted.snow.2025.norm, col=cl)

par(mfrow=c(2,3))
plot(snow.multitemp, col=cl)
plot(predicted.snow.2025.norm, col=cl)


