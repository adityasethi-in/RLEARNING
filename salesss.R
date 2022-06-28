setwd("C:\\Users\\Aditya\\Desktop\\R")
library(hrbrthemes)
library(readxl)
library(ggplot2)
library(plotly)
library(viridis)
main_data<-read_excel("sales.xlsx")
str(main_data)
head(main_data)
colnames(main_data)<-c("Items","SalesType","Orderpriority","OrderID","UnitSolds","UnitPrice","UnitCost","TR","TC","TP")
main_data
ggplot(data=main_data, aes(x=Items, fill=Orderpriority))+geom_bar(color="white")


ggplot(data=main_data, aes(x=Items, fill=SalesType))+geom_bar(color="white")
ggplot(data=main_data, aes(y=Items, x=UnitSolds, size=TP,color=SalesType ))+geom_point()
ggplot(data=main_data, aes(x=Items, y=TP , fill=TR))+scale_fill_gradient(low="white",high="blue")+theme_ipsum()+geom_tile()

k<-ggplot(data=main_data, aes(x=Items, y=Orderpriority, fill=TP ))+geom_tile()+scale_fill_viridis(discrete = FALSE)
  
  
ggplotly(data=k,tooltip = "text")
                                                             
ggplot(data=main_data, aes(y=Items, x=UnitSolds, size=TP,color=SalesType ))+geom_point()+geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE)+theme_ipsum()
