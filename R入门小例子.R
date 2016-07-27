#############################################################################
#一组学生参加了数学、科学和英语考试。
#为了给所有的学生确定一个单一的成绩衡量指标，需要将这些科目的成绩组合起来。
#另外，还想将前20%的学生评定为A，接下来20%的学生评定为B，以此类推。
#最后，希望按字母顺序对学生排序。
#############################################################################
Stuld <- c(1:10)
StuName <- c('John Davis','Angela Williams','Bull Jones','Cheryl Cushing',
             'Reuven Ytzrhak','Joel Knox','Mary Rayburn','Greg England','Brad Tmac','Tracy Mcgrady')
Math <- c(502,465,621,575,454,634,576,421,599,666)
Science <- c(95,67,78,66,96,89,78,56,68,10)
English <- c(25,12,22,18,15,30,37,12,22,38)
mydata <- data.frame(Stuld,StuName,Math,Science,English)
colnames(mydata)
mydata <- mydata[,-1]
##数据中心化、标准化##
#1、数据的中心化：指数据集中的各项数据减去数据集的均值
#2、数据的标准化：值中心化后的数据在除以数据集的标准差
#数据中心化和标准化的意义是一样的，为了消除量纲对数据结构的影响
##scale(data,center=T,scale=T)  center=T 表示数据中心化 scale=T 表示数据标准化
z <- scale(mydata[3:5])
##求每个学生的所有成绩均值##
#apply(X,MARGIN,FUN,...) 
#X:阵列包括矩阵,MARGIN:1表示矩阵行，2表示矩阵列，也可以是c(1,2) FUN:表示具体的运算方式
score <- apply(z,1,mean)
mydata$score<-apply(z,1,mean)
##姓名处理，将姓名列拆分为FirName,LatName两列
#使用strsplit(data,split="") data是一组向量,split表示分割方式
name<-strsplit(mydata$StuName,split=" ")  #data是向量所以这一句是报错的#
name<-strsplit(StuName,split=" ")  #把strsplit()应用到一个字符串组成的向量上会返回一个列表#
name<-unlist(strsplit(StuName,split=" "))#将strsplit的list形式转成向量格式#
name<-matrix(name,ncol=2,byrow=T) #将name转化为矩阵，这么做是为了拆分方便#
FirName<-name[,1]
LasName<-name[,2]
##合并
mydata<-cbind(mydata,FirName,LasName)
##去掉mydata多余的列
mydata<-mydata[-2]
##计算前20%等 用四分位来计算 quanile(data,c(.8,.6,.4,.2))
q<-quantile(mydata$score,c(.8,.6,.4,.2))
##按照四分位分等级
mydata$level[score>=q[1]] <- "A"
mydata$level[score>=q[2] & score<q[1]] <- "B"
mydata$level[score>=q[3] & score<q[2]] <- "c"
mydata$level[score>=q[4] & score<q[3]] <- "D"
mydata$level[score<q[4]] <- "E"
##按姓名排序
mydata<-mydata[order(mydata$LasName,mydata$FirName),]
options(digits=2)



----------------------------------------------------------------

mydata1 <- data.frame(Stuld,StuName,Math,Science,English)

name<-strsplit((StuName)," ")
lastname<-sapply(name,"[",2)
firstname<-sapply(name,"[",1)

sapply() 提取列表中每个成分的第一个元素，
“[”是一个可以提取某个对象一部分的函数

