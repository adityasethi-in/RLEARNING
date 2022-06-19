getwd()
setwd("C:\\Users\\Aditya\\Desktop\\R")
getwd()
library(readxl)
Mortgage<-read_excel("BETTER.xlsx")
investers<-Mortgage$Invester

loanterm<-Mortgage$`loan term`
library(ggplot2)
str(Mortgage)
fix<-Mortgage$`Fixed & ARM`
hist<-ggplot(data=Mortgage, aes(y=loanterm, fill = investers))+geom_histogram(binwidth=2, color="white")
int<-Mortgage$`rate of interest`
city<-Mortgage$City
tenure<-Mortgage$`loan term`
Point<-ggplot(data=Mortgage, aes(y=investers,x=int, color=fix))+geom_point(alpha=2)
loanamount<-Mortgage$`loan  value`
du<-Mortgage$`LP loan/DU loan`
LineMap<-ggplot(data=Mortgage, aes(y=loanamount,x=int, color=du)) +geom_line()+geom_smooth(alpha=0.2)           
library(hrbrthemes)
HeatMap<-ggplot(data=Mortgage, aes(y=investers,x=city,fill=loanamount))+geom_tile()+scale_fill_gradient(low="white",high="blue")+theme_ipsum()

library(ggpubr)
ggarrange(HeatMap,LineMap,hist,Point,labels = c("HeatMap", "LineMap", "Histogram","PointMap"),
               ncol = 2, nrow = 2)
