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
