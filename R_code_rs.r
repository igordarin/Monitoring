# R code for remote sensing data analysis

# raster
install.packages("raster")
install.packages("RStoolbox")

# install.packages(c("raster","RStoolbox"))

 setwd("~/Sgn/Monitoring ecosystems changes and functioning/lab")

library(raster)

p224r63_2011 <- brick("p224r63_2011_masked.grd")
plot(p224r63_2011)

cl <- colorRampPalette(c("black","grey", "light grey")) (100)
plot(p224r63_2011, col=

#multiframe of different plots

par(mfrow= c(2,2))
par(mfrow= c(4,1))

     # B1:blue
clb <- colorRampPalette(c("dark blue","blue", "light blue")) (100)
plot(p224r63_2011$B1_sre, col= clb)
     # B2:green
clg <- colorRampPalette(c("dark green","green", "light green")) (100)
plot(p224r63_2011$B2_sre, col= clg)
     # B3:red
clr <- colorRampPalette(c("dark red","red", "pink")) (100)
plot(p224r63_2011$B3_sre, col= clr)
     # B4:NIR
cln <- colorRampPalette(c("red","orange","yellow")) (100)
plot(p224r63_2011$B4_sre, col= cln)
par(mfrow= c(4,1))

#plotRGB
dev.off()
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")        
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")  

# exercise NIR on top of the G component
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
