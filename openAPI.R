library(XML)
library(dplyr)
library(httr)
library(ggplot2)
web=GET("http://openapi.forest.go.kr/openapi/service/trailInfoService/getforeststoryservice")
serviceURL <-"http://openapi.forest.go.kr/openapi/service/trailInfoService/getforeststoryservice"
serviceURL
operation<-"getforeststoryservice"
operation
serviceKey <-"%2Bd2O9yuKzyTCd8VPACq%2BbCPHqZa2jSglYvM2rAs1ZQfepirWMIfOhYpRWoDsxeOlb9YwXE0cexSLMbTPDwO8uw%3D%3D"
serviceKey
pageNo <-1
rows<-100
type_data_format <-"XML"
url <-paste0(serviceURL,
             operation,
             paste0("?serviceKey=",serviceKey),
             paste0("&pageNo=",pageNo),paste0("&numOfRows=",rows),paste0("&resultType=",type_data_format))

serviceURL

xmlDocument <-xmlTreeParse(serviceURL,useInternalNodes=TRUE,encoding="UTF-8")
rootNode <-xmlRoot(xmlDocument)
numOfRows <- as.numeric(xpathSApply(rootNode,"//numOfRows",xmlValue))
totalCount <-as.numeric(xpathSApply(rootNode,"//totalCount",xmlValue))
loopCount <-ceiling(totalCount/numOfRows)
finalTotalData<-data.frame()
for(i in 1:loopCount){
  url <-paste0(serviceURL,operation,paste0("?serviceKey=",serviceKey),paste0("&pageNo=",i),paste0("&numOfRows=",rows),paste0("&resultType=",type_data_format))
  doc <-xmlTreeParse(URL,useInternalNodes=TRUE,encoding="UTF-8")
  rootNode<-xmlRoot(doc)
  xmlData <-xmlToDataFrame(nodes=getNodeSet(rootNode,'//item'))
  finalTotalData <-rbind(finalTotalData,xmlData)
}
View(finalTotalData)

write.csv(finalTotalData,"산정보2.csv",row.names=FALSE)

}
