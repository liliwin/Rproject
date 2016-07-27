--------------------------------------------
install.packages("gcookbook")
install.packages("ggplot2")
library(ggplot2)
library(gcookbook)
attach(x)
colnames(x)
ggplot(x, aes(x=日期, y=开盘价, group=1)) + geom_line(linetype="dotted")
ggplot(x, aes(x=日期, y=收盘价)) + geom_line(size=2)

--------------------------------------------------------------

install.packages("gcookbook")
library(plotrix) 
x<-read.csv("G:/stock.csv",header=TRUE,sep=",")
b<-as.Date(x$日期)#日期类型转换
#将b与x合并两种方式
a<-data.frame(b,x[,-1])
names(a)<-c("日期","开盘价","最高价","最低价","收盘价")
colnames(a)
class(a[,1])
#or
x<-x[,-1]
x$日期<-b
colnames(x)
#双Y轴图
twoord.plot("日期","最高价","日期","最低价",data=a[,c(1,3,4)],type="l",lcol="red",rcol="blue",
            xlab="日期", ylab="最高价",rylab="最低价",  main="趋势分析")


top<-maxx[which.max(a[,3])]
low<-minx[which.min(a[,4])]

text(top,"最高价")
text(low,"最低价")

twoord.plot(日期,开盘价,日期,收盘价,type="b",lcol="red",rcol="blue",
              lpch=16,rpch=1,xlab="日期", ylab="开盘价",rylab="收盘价",  main="趋势分析" , 
              xtickpos=日期,xticklab=format(日期))


