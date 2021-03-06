# Correlation anaylsis with master chronology and averages of environmental variables in northern GOM and WFS

## to parse data from West Florida Shelf#########################

data= read.csv("BC_11_17_14.csv", header=TRUE)

idx3 <- data$Increment.Number==3 
idx4<- data$Increment.Number==4 
idx5 <- data$Increment.Number ==5 
idx6 <- data$Increment.Number ==6 
idx7 <- data$Increment.Number==7

data_3 <- data[idx3,]
data_4 <- data[idx4,]
data_5 <- data[idx5,]
data_6 <- data[idx6,]
data_7 <- data[idx7,]

data_wk= data.frame(rbind(data_3, data_4, data_5, data_6, data_7))



data_wk$nJune.U = as.numeric(as.character(data_wk$June.U));
data_wk$nJuly.U = as.numeric(as.character(data_wk$July.U));
data_wk$nAugust.U = as.numeric(as.character(data_wk$August.U));
data_wk$nSeptember.U = as.numeric(as.character(data_wk$September.U));
data_wk$nOctober.U = as.numeric(as.character(data_wk$October.U));
data_wk$nNovember.U = as.numeric(as.character(data_wk$November.U));
data_wk$nDecember.U = as.numeric(as.character(data_wk$December.U));

data_wk$nJune.V = as.numeric(as.character(data_wk$June.V));
data_wk$nJuly.V = as.numeric(as.character(data_wk$July.V));
data_wk$nAugust.V = as.numeric(as.character(data_wk$August.V));
data_wk$nSeptember.V = as.numeric(as.character(data_wk$September.V));
data_wk$nOctober.V = as.numeric(as.character(data_wk$October.V));
data_wk$nNovember.V = as.numeric(as.character(data_wk$November.V));
data_wk$nDecember.V = as.numeric(as.character(data_wk$December.V));

data_wk$nAvg.Discharge= as.numeric(as.character(data_wk$Avg.Discharge))

data_wk$nJune.MSLA = as.numeric(as.character(data_wk$June.MSLA))
data_wk$nJuly.MSLA = as.numeric(as.character(data_wk$July.MSLA))
data_wk$nAugust.MSLA = as.numeric(as.character(data_wk$August.MSLA))
data_wk$nSeptember.MSLA = as.numeric(as.character(data_wk$September.MSLA))
data_wk$nOctober.MSLA = as.numeric(as.character(data_wk$October.MSLA))
data_wk$nNovember.MSLA = as.numeric(as.character(data_wk$November.MSLA))
data_wk$nDecember.MSLA = as.numeric(as.character(data_wk$December.MSLA))

data_wk$nJune.WSC = as.numeric(as.character(data_wk$June.WSC))
data_wk$nJuly.WSC = as.numeric(as.character(data_wk$July.WSC))
data_wk$nAugust.WSC = as.numeric(as.character(data_wk$August.WSC))
data_wk$nSeptember.WSC = as.numeric(as.character(data_wk$September.WSC))
data_wk$nOctober.WSC = as.numeric(as.character(data_wk$October.WSC))
data_wk$nNovember.WSC = as.numeric(as.character(data_wk$November.WSC))
data_wk$nDecember.WSC = as.numeric(as.character(data_wk$December.WSC))



IncW <- data_wk$Increment.Width

Av.Dis <- data_wk$nAvg.Discharge 

Year.of.Increment.Formation <- data_wk$Year.of.Increment.Formation

CatchYr <- data_wk$Catch.Year

Fish.ID <- data_wk$Fish.ID

Age.at.Catch <- data_wk$Age.at.Catch

IncNum <- data_wk$Increment.Number

Detrended <- data_wk$R.Detrended

U_winds= cbind(data_wk$nJune.U, data_wk$nJuly.U, data_wk$nAugust.U, data_wk$nSeptember.U, data_wk$nOctober.U, data_wk$nNovember.U, data_wk$nDecember.U)

U_wind_median = apply(U_winds,1,median)

V_winds= cbind(data_wk$nJune.V, data_wk$nJuly.V, data_wk$nAugust.V, data_wk$nSeptember.V, data_wk$nOctober.V, data_wk$nNovember.V, data_wk$nDecember.V)

V_wind_median= apply(V_winds,1,median)

MSLA = cbind(data_wk$nJune.MSLA, data_wk$nJuly.MSLA,data_wk$nAugust.MSLA,data_wk$nSeptember.MSLA,data_wk$nOctober.MSLA,data_wk$nNovember.MSLA,data_wk$nDecember.MSLA)

MSLA_median=apply(MSLA, 1, median)

WSC = cbind(data_wk$nJune.WSC, data_wk$nJuly.WSC,data_wk$nAugust.WSC,data_wk$nSeptember.WSC,data_wk$nOctober.WSC,data_wk$nNovember.WSC,data_wk$nDecember.WSC)

WSC_median=apply(WSC,1,median)

library(MASS)
b <- boxcox(lm(IncW ~ IncNum, data=data_wk), lambda=seq(-2,2,by=.1))
lambda=b$x
like=b$y
c=cbind(lambda, like)
c[order(-like),]

data_wk1=cbind(Detrended, IncW, IncW^(.181), IncNum, data_wk$Year.of.Increment.Formation, U_wind_median, V_wind_median, Av.Dis, MSLA_median,WSC_median, CatchYr, Fish.ID)
## the IncW^.303 was added based on lines below that determine the optimal Boxcox transformation 
colnames(data_wk1) = c("Detrended", "IncW", "IncW_trans", "IncNum", "Yr.Inc.Form", "Uwind", "Vwind", "Av.Dis", "MSLA", "WSC","CatchYr", "Fish")



data_wkdf = data.frame(data_wk1)


library(plyr)
U_mean<-ddply(data_wkdf, .(Yr.Inc.Form), summarise, N=length(!is.na(Uwind)), U.mean=mean(Uwind, na.rm=TRUE), sd=sd(Uwind, na.rm=TRUE), se=sd/sqrt(N))
V_mean <- ddply(data_wkdf, .(Yr.Inc.Form), summarise, N=length(!is.na(Vwind)), V.mean=mean(Vwind, na.rm=TRUE), sd=sd(Vwind, na.rm=TRUE), se=sd/sqrt(N))
MSLA_mean <- ddply(data_wkdf, .(Yr.Inc.Form), summarise, N=length(!is.na(MSLA)), MSLA.mean=mean(MSLA, na.rm=TRUE), sd=sd(MSLA, na.rm=TRUE), se=sd/sqrt(N))
WSC_mean <- ddply(data_wkdf, .(Yr.Inc.Form), summarise, N=length(!is.na(WSC)), WSC.mean=mean(WSC, na.rm=TRUE), sd=sd(WSC, na.rm=TRUE), se=sd/sqrt(N))
Av.Dis_mean <- ddply(data_wkdf, .(Yr.Inc.Form), summarise, N=length(!is.na(Av.Dis)), Av.Dis.mean=mean(Av.Dis, na.rm=TRUE), sd=sd(Av.Dis, na.rm=TRUE), se=sd/sqrt(N))


## correlate to master chronology
IW = read.csv('Increments(-1st and last).csv', header=T)


col <- colnames(IW)
row <- rownames(IW)

library(dplR)
rwi <- detrend(IW, method="ModNegExp")
rwi.crn <- chron(rwi)# creates mean chronology based on Tukeys biweight robust mean (an average unaffected by outliers)

rwi.crn <- rwi.crn[1:10,]

time <- c(2004:2013)
new_rwi.crn <- cbind(time, rwi.crn)

plot(new_rwi.crn$xxxstd[3:9], Av.Dis_mean$Av.Dis.mean)
plot(new_rwi.crn$xxxstd[3:9], WSC_mean$WSC.mean)
plot(new_rwi.crn$xxxstd[3:9], MSLA_mean$MSLA.mean)
plot(new_rwi.crn$xxxstd[3:9], V_mean$V.mean)
plot(new_rwi.crn$xxxstd[3:9], U_mean$U.mean)

newdata <- cbind(new_rwi.crn$xxxstd[3:9], Av.Dis_mean$Av.Dis.mean, WSC_mean$WSC.mean, MSLA_mean$MSLA.mean, V_mean$V.mean, U_mean$U.mean)
pairs(newdata)
cor(newdata)

## correlate envirodata to age specific growth increments

## seperate by increment number


idx3 <- data_wkdf$IncNum==3 
idx4<- data_wkdf$IncNum==4 
idx5 <- data_wkdf$IncNum ==5 
idx6 <- data_wkdf$IncNum ==6 
idx7 <- data_wkdf$IncNum==7


data_wkdf_3 <- data_wkdf[idx3,]
data_wkdf_4 <- data_wkdf[idx4,]
data_wkdf_5 <- data_wkdf[idx5,]
data_wkdf_6 <- data_wkdf[idx6,]
data_wkdf_7 <- data_wkdf[idx7,]

three <- ddply(data_wkdf_3, .(Yr.Inc.Form), summarise, N=length(IncW), three.mean=mean(IncW))
four <- ddply(data_wkdf_4, .(Yr.Inc.Form), summarise, N=length(IncW), four.mean=mean(IncW))
five <- ddply(data_wkdf_5, .(Yr.Inc.Form), summarise, N=length(IncW), five.mean=mean(IncW))
six <- ddply(data_wkdf_6, .(Yr.Inc.Form), summarise, N=length(IncW), six.mean=mean(IncW))
seven <- ddply(data_wkdf_7, .(Yr.Inc.Form), summarise, N=length(IncW), seven.mean=mean(IncW))


age3_env <- cbind(three$three.mean, Av.Dis_mean$Av.Dis.mean[1:6], WSC_mean$WSC.mean[1:6], MSLA_mean$MSLA.mean[1:6], V_mean$V.mean[1:6], U_mean$U.mean[1:6])
cor(age3_env)
pairs(age3_env)


age4_env <- cbind(four$four.mean, Av.Dis_mean$Av.Dis.mean[2:7], WSC_mean$WSC.mean[2:7], MSLA_mean$MSLA.mean[2:7], V_mean$V.mean[2:7], U_mean$U.mean[2:7])
cor(age4_env)

age5_env <- cbind(five$five.mean, Av.Dis_mean$Av.Dis.mean[3:7], WSC_mean$WSC.mean[3:7], MSLA_mean$MSLA.mean[3:7], V_mean$V.mean[3:7], U_mean$U.mean[3:7])
cor(age5_env)

age6_env <- cbind(six$six.mean, Av.Dis_mean$Av.Dis.mean[4:7], WSC_mean$WSC.mean[4:7], MSLA_mean$MSLA.mean[4:7], V_mean$V.mean[4:7], U_mean$U.mean[4:7])
cor(age6_env)

