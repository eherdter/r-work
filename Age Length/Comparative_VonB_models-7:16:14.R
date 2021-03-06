# My combined fit for all data plus fits for other data sets

setwd("~/Desktop/Github Repo/r-work/Age Length")
mydata <- read.csv("Raw_Age_length.csv", header=TRUE,sep=",")
setwd("~/Desktop/Github Repo/r-work")
inc_data <- read.csv("BC_12_16.csv", header=TRUE, sep=",")

x = data.frame(mydata$Fractional.Age)  #make age matrix
y = data.frame(mydata$Fork.Length..cm) #make length matrix
data <- cbind(x, y) #combine age and length matrices 
idx_remove <- x>0.8 # make an index tht only has ages over 0.8 (0.8 represents missing ages in the main data sheet)
data_wk<-data.frame(data[idx_remove,]) # apply the index to Data and then make a data frame
data_wk <- data.frame(data_wk[complete.cases(data_wk),]) # only take complete cases from the data_wk data frame and then apply data.frame
colnames(data_wk) <- c("x", "y") #give column names to the new data_wk column

data_wk$x <- as.numeric(as.character(data_wk$x))  # for some reason the above values were turned to characters so the below code was acting funny. by changing the x values to numeric values it seems to also change the y values to numeric values


# setting starting variables where P1= Linf, P2= K and P3= t0 where t0= age where organisms would have zero size

p1 = 80
p2 = .18
p3= 0


fit = nls(y ~ p1*(1-exp(-p2*(x-p3))), start=list(p1=p1, p2=p2,p3=p3), data=data_wk) #estimate fit of the three parameters in the Von B equation

summary(fit)

#getting sum of squared residuals

sum(resid(fit)^2)

#parameter confidence intervals

confint(fit)


#     p1      p2      p3 
#82.9131  0.2043  0.4331 


data_back= data.frame(cbind(inc_data$Increment.Number, inc_data$Biological.Intercept, inc_data$Year.of.Increment.Formation))  #making a data set of the back calculated fork lengths

idx_after = data_back$X3 >= 2010
idx_before= data_back$X3 < 2010

code= rep("Before", 733)
before = data.frame(cbind((data_back[idx_before,]), code))

colnames(before)<- c("Age", "Back_Calc_FL", "Year", "Code")

code= rep("After", 520 )
after = data.frame(cbind(data_back[idx_after,]), code)
colnames(after) <- c("Age", "Back_Calc_FL", "Year", "Code")

p1 = 80
p2 = .18
p3= 0


fit_before = nls(Back_Calc_FL ~ p1*(1-exp(-p2*(Age-p3))), start=list(p1=p1, p2=p2,p3=p3), data=before) #estimate fit of the three parameters in the Von B equation from back calculated length estimates before 2010
fit_after = nls(Back_Calc_FL ~ p1*(1-exp(-p2*(Age-p3))), start=list(p1=p1, p2=p2,p3=p3), data=after) #estimate fit of the three parameters in the Von B equation from back calculated length estimates in and after 2010)


summary(fit_before)
summary(fit_after)


combined <- rbind(before, after)

## KIMURA LIKELIHOOD TESTING ##


library(fishmethods)
output_before_after<- vblrt(combined$Back_Calc_FL, combined$Age, group=combined$Code, error=1, select=2,Linf=40, K=.20, t0=-.18, plottype=0)

output_before_after$results


# Following Kimura (1980), the general model (6 parameters; one L-infinity, K, and t0 for each group) and four sub models are fitted to the length and age data using function nls (nonlinear least squares). For each general model-sub model comparison, likelihood ratios are calculated by using the residual sum-of-squares and are tested against chi-square statistics with the appropriate degrees of freedom. Individual observations of lengths-at-age are required. If error variance assumptions 2 or 3, mean lengths and required statistics are calculated. A dummy vector called cat, containing 0s for the first group with lower alpha-numeric order and 1s for the second group, is used in the estimation of group parameters. To extract the VB parameters for each group from the Ho model: # Group 1 Linf1<-outpt$'model Ho'$coefficients[1]         K1<-outpt$'model Ho'$coefficients[3]         t01<-outpt$'model Ho'$coefficients[5]
# # Group 2         Linf2<-Linf1+outpt$'model Ho'$coefficients[2]         K2<-K1+outpt$'model Ho'$coefficients[4]         t02<-t01+outpt$'model Ho'$coefficients[6]      where outpt is the output object. For models H1, H2, H3 and H4, the shared VB parameter for the second group will be the same as the first group.

# #Group 1
# Linf <- outpt$'model Ho'$coefficients[1]
# K <- outpt$'modelHo'$coefficents[3]
# t01 <-outpt$'modelHo'$coefficients[5]

# #Group 2

# Linf2<-Linf1+outpt$'modelHo'$coefficients[2]
# K2<-K1+outpt$'modelHo'$coefficients[4]
# t02 <-t01 +outpt$'modelHo'$coefficients[6]






seq= seq(1:44)  # making an age sequence (ages 1 to 44)
x_sample <- matrix(seq, ncol=1) #turning the above age sequence into a matrix

Liz_fit <- 82.9131 *(1-exp(-.2043*(x_sample-(.4331)))) #making a fitted line with the estimated parameters and using the defined age sequence x_sample
Liz_before_fit <- 80.307 *(1-exp(-.201*(x_sample-(-0.9601)))) #making a fitted line with the estimated parameters from the back calculated length data occuring before 2010. then using the defined age sequence x_sample
Liz_after_fit <- 80.643 *(1-exp(-0.227*(x_sample-(-0.06)))) #making a fitted line with the estimtaed paramters from the back calculated length data occuring in and after 2010 and then using the defined age sequence x_sample
w_fit <- 941 *(1-exp(-.18*(x_sample-(-0.53)))) #using Wilsons obtained parameters to estimate a Total lengths
w_fit_adjusted= ((w_fit-.3868)/1.058)/10 # use the obtained total length estimates and then convert them to Fork length estimates in centimeters using the SEDAR relationship

P01_fit <- 969 *(1-exp(-.192*(x_sample-(0.020))))  # patterson et al. 2001
P01_fit_adjusted= ((P01_fit-.3868)/1.058)/10 ## to convert to FL and then to centimeters

SS94_fit <- 1025 *(1-exp(-.150*(x_sample-(0)))) # the t0 was unreported so I just set it to 0
SS94_fit_adjusted= ((SS94_fit-.3868)/1.058)/10 ## to convert to FL and then to centimeters
 
 
NM82_fit <- 941 *(1-exp(-.170*(x_sample-(-.10)))) # the t0 was unreported so I just set it to 0
NM82_fit_adjusted= ((NM82_fit-.3868)/1.058)/10 ## to convert to FL and then to centimeters

MP97_fit <- 955 *(1-exp(-.146*(x_sample-(.182)))) # the t0 was unreported so I just set it to 0
MP97_fit_adjusted= ((MP97_fit-.3868)/1.058)/10 ## to convert to FL and then to centimeters




fitted_label <- rep("Post DWH", 44)
before_label <- rep("Back Calculated pre DWH", 44)
after_label <- rep("Back Calculated post DWH", 44)
fitted <- data.frame(fitted_label, x_sample, Liz_fit)
fitted_before <- data.frame(before_label, x_sample, Liz_before_fit)
fitted_after <- data.frame(after_label, x_sample, Liz_after_fit)
colnames(fitted) <- c("Label", "x", "y")
colnames(fitted_before) <- c("Label", "x", "y")
colnames(fitted_after) <- c("Label", "x", "y")

Wilson_label <- rep("W 01", 44)
Wilson <- data.frame(Wilson_label, x_sample, w_fit_adjusted)
colnames(Wilson) <- c("Label", "x", "y")


P_label <- rep("P 01", 44)
P01 <- data.frame(P_label, x_sample, P01_fit_adjusted)
colnames(P01) <- c("Label", "x", "y")

SS_label <- rep("S&S 94", 44)
SS94 <- data.frame(SS_label, x_sample, SS94_fit_adjusted)
colnames(SS94) <- c("Label", "x", "y")

NM_label <- rep("N&M 82", 44)
NM82 <- data.frame(NM_label, x_sample, NM82_fit_adjusted)
colnames(NM82) <- c("Label", "x", "y")

MP_label <- rep("M&P 97", 44)
MP97 <- data.frame(MP_label, x_sample, MP97_fit_adjusted)
colnames(MP97) <- c("Label", "x", "y")


#observed_label <- rep("Observed",819)  # the data_wk data.frame did not adjust for the number of variables after I did an index and then complete.cases but the real number is 819 which was obtained by str(data_wk)
#observed <- data.frame(cbind(observed_label, data_wk))
#colnames(observed) <- c("Label", "x", "y")


df_comparative <- data.frame(rbind(fitted,fitted_before, Wilson, P01, SS94, NM82, MP97 ))

library(ggplot2)

install.packages("extrafont") #http://blog.revolutionanalytics.com/2012/09/how-to-use-your-favorite-fonts-in-r-charts.html
library(extrafont)
font_import()

VonB_Comparative <- ggplot(data= df_comparative, aes(x=x, y=y), group=Label)+  
	 geom_line(aes(linetype=Label), size =.5)+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	#geom_point(aes(group=Label, shape=Label))+ # groups the points together correctly and then gives them a unique shape them differently based on the line type 
	#scale_shape_manual(values=c(16,20,20, 7, 11, 13))+
	#scale_linetype_manual(values=c('solid', 'dashed', 'dotted'))+
	#scale_y_continuous(limits=c(0,100), breaks= seq(0,100,10))+
	scale_x_continuous(limits=c(0,35), breaks=seq(0,30,5))+
	xlab("Age (years)")+
	ylab("Fork Length (cm)")+
	theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 									
    panel.background=element_rect(fill='white', colour='black'),
		legend.key=element_blank(), legend.title=element_blank(),
		legend.background=element_rect(fill='white', size=.5),
		legend.position=c(.70,.38),
    axis.title.y = element_text(family= "Times New Roman",colour="black", size=24), # changing font of y axis title
    axis.title.x = element_text(family="Times New Roman", colour="black", size=24),
		axis.text.x=element_text(family= "Times New Roman", colour="black", size=24), #changing  colour and font of x axis text
		axis.text.y=element_text(family= "Times New Roman", colour="black", size=24), #changing colour and font of y axis
		#plot.title=element_text(size=14), # changing size of plot title)+
		legend.text=element_text(family= "Times New Roman", size=20))
	#ggtitle("Comparative von Bertalanffy Growth Models")




tiff("Comparative_VonB.tiff", width= 2175, height= 1449, units="px", res=300) #,  pointsize=20)
# # width and height are 1050 and 699 respectively based on http://blogs.mathworks.com/steve/2006/03/03/help-my-publisher-wants-a-300-dpi-tiff/
 plot(VonB_Comparative)
dev.off()




 ## with just Wilson and Patterson ###
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")


VonB_Comparative_basic <- ggplot(data= subset(df_comparative, Label %in% c("Current Study", "W 01", "P 01")), aes(x=x, y=y), group=Label)+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour=Label), size=.85)+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	#geom_point(data=subsetaes(group=Label, shape=Label))+ # groups the points together correctly and then gives them a unique shape them differently based on the line type 
	#scale_shape_manual(values=c(16,20,20, 7, 11, 13))+
	#scale_linetype_manual(values=c('solid', 'dashed', 'dotted'))+
	#scale_y_continuous(limits=c(0,100), breaks= seq(0,100,10))+
	#scale_x_continuous(limits=c(0,45), breaks=seq(0,45,5))+
	scale_colour_manual(values=cbbPalette)+
	xlab("Age (yrs)")+
	ylab("Fork Length (cm)")+
	theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 									panel.background=element_rect(fill='white', colour='black'),
		legend.key=element_blank(), legend.title=element_blank(),
		legend.background=element_rect(fill='white', size=.5),
		legend.position=c(.95,.55),
		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14), # changing size of plot title)+
		legend.text=element_text(size=10))
	#ggtitle("Comparative von Bertalanffy Growth Models")

	
#ggsave('/Users/elizabethherdter/Desktop/R_workspace/Figures/Comparative_VonB_models_BASIC.pdf', plot=VonB_Comparative_basic, width=7, height=4.5)

