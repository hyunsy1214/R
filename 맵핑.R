getwd()
setwd("C:/R_temp")
install.packages("ggplot2")
install.packages("ggmap")
library(ggmap)
register_google(key='AIzaSyDrNMf0vqlvzS1wsy2Qxzuwq-FwvnQ1ims')
ggmap(get_map(location='south korea',zoom=7))
map <- get_map(location='south korea', zoom=7, maptype='terrain')
ggmap(map)
location <- read.csv("location.csv", header=T, as.is=T)
head(location)
ggmap(map)
geom_point(data=location, aes(x=long, y=lat))
ggmap(map)+geom_point(data=location, aes(x=long, y=lat))


#나중에 전체 엑셀 파일에서 특정 칼럼만 어떻게 뽑아오는지 알아보기
