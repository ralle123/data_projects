rm(list = ls())
setwd("/Users/test/code/geolocationdata")
#install.packages("ggmap")
library(ggmap)
library(RCurl)
myUrl<-getURL("http://opendata.toronto.ca/transportation/tmc/rescucameraimages/Data/tmcearthcameras.csv")
traffic_cams<-read.csv(text=myUrl)
myLocation <- c(lon = -79.3878,lat = 43.641) 
myMap1 <- get_map(location=myLocation, source="stamen",zoom=12, maptype="watercolor")
Cameras<-ggmap(myMap1) + labs(title='Traffic Cameras in Toronto',x="Longitude",y="Latitude")+
      annotate('segment', x=-79.43, xend=-79.47, y=43.63, yend=43.665,
          colour=I('black'), arrow = arrow(length=unit(0.4,"cm")), linewidth = 1.5) + 
      annotate('rect', xmin=-79.47, ymin=43.62, xmax=-79.39, ymax=43.63,
           fill = I('black'), alpha = I(3/4)) +
      annotate('text', x=-79.43, y=43.625, label = 'I lived here',colour = I('white'), size = 6)+
  stat_density2d(aes(x = Longitude, y = Latitude,fill = ..level.. , alpha = ..level..),size = 4, bins = 9,data = traffic_cams, geom = 'polygon')

print(Cameras)
