# R_code_cladonia_focal.r

# raster = 1 layer
## brick = several layers

library(raster)
library(RStoolbox)

clad <- brick("cladonia_stellaris_calaita.JPG")#now i should have a multibanded image

plotRGB(clad,1,2,3, stretch="lin")

# matrix 3x3
window <- matrix(1,nrow = 3,ncol = 3)# value for the pixels, in this case 1 will not affect the SD
window

# pairs(clad), never run it during lesson!

# focal calculate the values for the neghbouring cells

## PCA analysis
cladpca <- rasterPCA(clad)

cladpca
summary(cladpca$model)

plotRGB(cladpca$map,1,2,3,stretch="lin")

sd_clad <- focal(cladpca$map$PC1, w=window, fun=sd) 
# difficult calculations with the full image calculations so let's aggregate

PC1_agg <- aggregate(cladpca$map$PC1, fact=10)
sd_clad <- focal(PC1_agg, w=window, fun=sd)

par(mfrow=c(1,2))
cl <- colorRampPalette(c('yellow','violet','black'))(100) #
plot(sd_clad, col=cl)
plot(sd_clad_agg, col=cl)

# plot the calculation
par(mfrow=c(1,2))
cl <- colorRampPalette(c('yellow','violet','black'))(100) #
plot()
plotRGB(clad, 1,2,3, stretch="lin")
plot(sd_clad, col=cl)
# plot(sd_clad_agg, col=cl)

