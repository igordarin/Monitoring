# R_code_faPAR.r
# how to look for chemical cycling from satellites
# data file "faPAR10" is already aggregated by fact=10  (clumping 10x10 pixels)

library(raster)
library(rasterVis)
library(rasterdiv)

plot(copNDVI)

copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
levelplot(copNDVI)

faPAR10 <- raster("faPAR10.tif")
levelplot(faPAR10)

pdf("copNDVI.pdf")
levelplot(copNDVI)
dev.off()

pdf("faPAR.pdf")
levelplot(faPAR10)
dev.off()
