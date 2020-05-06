library(vegan)
library(raster)
library(rstoolbox)
library(ggplot2)

# setwd() now i'm using projects so no need for setwd as the proj is in the lab folder

p224r63_2011 <- brick("p224r63_2011_masked.grd")
plot(p224r63_2011)

#rgb
plotRGB(p224r63_2011, r=5, g=4, b=3, stretch="Lin" )

ggRGB(p224r63_2011,5,4,3)

p224r63_1988 <- brick("p224r63_1988_masked.grd")
plot(p224r63_1988)

par(mfrow=c(1,2))
plotRGB(p224r63_1988, r=5, g=4, b=3, stretch="Lin")
plotRGB(p224r63_2011, r=5, g=4, b=3, stretch="Lin")

names(p224r63_2011)
#[1] "B1_sre" "B2_sre" "B3_sre" "B4_sre" "B5_sre" "B6_bt"  "B7_sre"

dev.off()
plot(p224r63_2011$B1_sre,p224r63_2011$B3_sre)

p224r63_2011 #to see the resolution

# decrease the resolution

p224r63_2011_res <- aggregate(p224r63_2011, fact=10)

p224r63_2011_pca <- rasterPCA(p224r63_2011_res)

plot(p224r63_2011_pca$map)

cl <- colorRampPalette(c('dark grey','grey','light grey'))(100) # 
plot(p224r63_2011_pca$map, col=cl)

summary(p224r63_2011_pca$model)
pairs(p224r63_2011)

plotRGB(p224r63_2011_pca$map, r=1, g=2, b=3. stretc="Lin")

# 1988
p224r63_1988_res <- aggregate(p224r63_1988, fact=10)
p224r63_1988_pca <- rasterPCA(p224r63_1988_res) 
plot(p224r63_1988_pca$map, col=cl)

summary(p224r63_1988_pca$model)
pairs(p224r63_1988)

# difference

difpca <- p224r63_2011_pca$map - p224r63_1988_pca$map
plot(difpca)

cldif <- colorRampPalette(c('blue','black','yellow'))(100) 
plot(difpca$PC1,col=cldif)


