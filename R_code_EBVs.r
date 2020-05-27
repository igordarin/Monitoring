# R_code_EBVs.r

## image aggregated by fact=10

library(raster)
library(RStoolbox) req for PCA

snt <- brick("snt_r10.tif")

plot(snt)

# blue
# green
# red
# NIR

plotRGB(snt, 3,2,1, stretch="lin")

plotRGB(snt, 4,2,1, stretch="lin")

##  pairs(snt)  it requires a lot of time with this poor little pc so pay attention pairs(snt)

cl <- colorRampPalette(c("blue","green","orange","red")) (100)

# PCA analysis
sntpca <- rasterPCA(snt)

summary(sntpca$model)
## 70% of information

plot(sntpca$model)

plotRGB(sntpca$map, 1,2,3, stretch = "lin")

# set the moving window
window <- matrix(1,nrow = 5,ncol = 5)

# focal functions (google it)
sd_snt <- focal(sntpca$map$PC1, w=window, fun= sd) # standard deviation

plot(sd_snt, col=cl)


par(mfrow=c(1,2))

plotRGB(snt,4,3,2, stretch="lin", main="original image") 
plot(sd_snt, col=cl, main= "diversity")
