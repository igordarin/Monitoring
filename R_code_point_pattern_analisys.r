#R_code_point_pattern_analisys.r

install.packages("spatstat")
libray(spatstat)

attach(covid)
head(covid)

covids <- ppp(lon, lat, C(-180,180), c(-90,90)) # dont konw why but it gives an error
covids <- ppp(x = lon,y = lat, c(-180,180), c(-90,90)) # but not with complete arguments

# without attach you can use:
# covids <- ppp(covid$lon, covid$lat, C(-180,180), c(-90,90))
# maybe it could have solved the previuos error, try it next time

d <- density(covids)
plot(d) # obviuosly
points(covids)

# d <- raster::raster(d)  the :: operator is package::function in order tu use functions without loading the whole package 
# also excluding homonym functions in different packages
# d
# plot (d)

#part 2
# covids <- points
# d <- density map

library(spatstat)
library(rgdal) 

# let's imput the vector lines
plot(d)
points(covids)

coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T) # add to previous plot
coastlines <- readOGR("ne_10m_coastline.shp") 
# directly download and import coastlines within R:
# install.packages("rnaturalearth")
# coastlines <- rnaturalearth::ne_download(scale = 10, type = 'coastline', category = 'physical')

plot(coastlines, add=T)
cl <- colorRampPalette(c('yellow','orange','red')) (100) # 100 is the number of colours for the palette
plot(d, col=cl)

# export
pdf("covid_density.pdf")
cl <- colorRampPalette(c( 'blue','lightgreen','yellow','orange','red','darkred')) (100)
plot(d, col=cl, main="Densities of covid-19")
points(covids)
plot(coastlines, add=T)
dev.off() 

