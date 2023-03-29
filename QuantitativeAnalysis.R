
install.packages("lmtest")
install.packages("sandwich")
install.packages("packagename")
library(lmtest)
library(foreign)
library(ggplot2)
library(reshape2)
library(readxl)
library(Hmisc)
library(MASS)

#Import data
df <- read_excel("Clean Sorted D2 Data.xlsx")
summary(df)

df.cor = cor(df)
rcorr(as.matrix(df))

#model1
model1<-lm(df$VacLikelihood~df$IncomeMeetNeeds+df$HouseSize+df$Age+df$EdLevel)
summary(model1)
anova(model1)
par(mfrow=c(2,2))
plot(model1)

#we will perform a Breusch-Pagan Test to determine if heteroscedasticity is present.
bptest(model1)

#perform log transformation
log_y <- log10(df$VacLikelihood)

#reate histograms to view the distribution of y before and after performing a log transformation:
#create histogram for original distribution
hist(df$VacLikelihood, col='steelblue', main='Original')

#create histogram for log-transformed distribution 
hist(log_y, col='coral2', main='Log Transformed')
#no difference.....

#perform Shapiro-Wilk Test on original data
shapiro.test(resid(model1))

#perform Shapiro-Wilk Test on log-transformed data ,   deleted 
shapiro.test(resid(log_y))

#Both fails the normality assumption

# We will apply OLR
model1b<-polr(factor(df$VacLikelihood)~df$IncomeMeetNeeds+df$HouseSize+df$Age+df$EdLevel, data=df, Hess=TRUE)
summary(model1b)

#calculate some essential metrics such as p-Value, CI, Odds ratio
ctable<-coef(summary(model1b))
p <- pnorm(abs(ctable[, "t value"]), lower.tail = FALSE) * 2
ctable<-cbind(ctable, "p value"=p)
ctable

#Confidence Intervals
ci <- confint(model1b)
ci

exp(coef(model1b))
## OR and CI
exp(cbind(OR = coef(model1b), ci))

#enhance this model to obtain better prediction estimates.
summary(update(model1b, method = "probit", Hess = TRUE), digits = 3)
summary(update(model1b, method = "logistic", Hess = TRUE), digits = 3)
summary(update(model1b, method = "cloglog", Hess = TRUE), digits = 3)

addterm(model1b, ~.^2, test = "Chisq")
model1c <- stepAIC(model1b, ~.^2)
model1c
summary(model1c)
model1c$anova
anova(model1b, model1c)

#plot the model1c
model1d<-update(model1b, Hess=TRUE)
pr<-profile(model1d)
confint(pr)

plot(pr)
pairs(pr)



#model2
model2<-lm(df$VacLikelihood~df$SymptomsGetTest+df$HouseSize+df$Age+df$EdLevel)
summary(model2)
anova(model2)
par(mfrow=c(2,2))
plot(model2)

#we will perform a Breusch-Pagan Test to determine if heteroscedasticity is present.
bptest(model2)

#perform Shapiro-Wilk Test on original data
shapiro.test(resid(model2))


#model3
model3<-lm(df$VacLikelihood~df$ConcernTravelPlane+df$HouseSize+df$Age+df$EdLevel)
summary(model3)
anova(model3)
par(mfrow=c(2,2))
plot(model3)

#we will perform a Breusch-Pagan Test to determine if heteroscedasticity is present.
bptest(model3)

#perform Shapiro-Wilk Test on original data
shapiro.test(resid(model3))

#model4

model4<-lm(df$VacLikelihood~df$IncomeMeetNeeds+df$SymptomsGetTest+df$OrderTakeout+df$ConcernGoRestaurants+df$ConcernTravelPlane+df$StockFoodsEssentials+df$HouseSize+df$Age+df$EdLevel)
car::vif(model4)

summary(model4)
anova(model4)
AIC(model4)
#model5
model5<-lm(df$VacLikelihood~df$IncomeMeetNeeds+df$SymptomsGetTest+df$OrderTakeout+df$ConcernGoRestaurants+df$ConcernTravelPlane+df$HouseSize+df$Age+df$EdLevel)
summary(model5)
AIC(model5)
car::vif(model5)

model6<-lm(df$VacLikelihood~df$IncomeMeetNeeds+df$SymptomsGetTest+df$OrderTakeout+df$ConcernGoRestaurants+df$ConcernTravelPlane+df$ConcernGoRestaurants:df$ConcernTravelPlane+df$HouseSize+df$Age+df$EdLevel)
summary(model6)
AIC(model6)
car::vif(model6)

modelC<-polr(formula = factor(df$VacLikelihood)~df$IncomeMeetNeeds+df$SymptomsGetTest+df$OrderTakeout+df$ConcernGoRestaurants+df$ConcernTravelPlane+df$ConcernGoRestaurants:df$ConcernTravelPlane+df$HouseSize+df$Age+df$EdLevel, data=df, Hess=TRUE)
summary(modelC)
car::vif(modelC)