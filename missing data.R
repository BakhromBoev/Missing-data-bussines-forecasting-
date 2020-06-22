head()
head(eurusd)
tail(eurusd)
head(eurusd)
colnames(eurusd)=c("DATA", "TIME", "VALUE", "HIGH", "LOW", "OPEN", "CLOSE")


str(eurusd) # we see that like factor, numerical , integre

class(eurusd) # answer of data frame
head(eurusd, 28)

eurusd$AVERAGE=(eurusd$HIGH+eurusd$OPEN+eurusd$LOW/5)
head(eurusd)

#missing value
any(is.na(eurusd)) #true or false
table(is.na(eurusd))  #how many missing values
sapply(eurusd, function(x) sum(is.na(x)))  #check by columns      
newdata = na.omit(eurusd) #without missing value with new data frame

RPM = abs(newdata$LOW - newdata$VALUE)*100/2


newdata$RPM=RPM
newdata$rpm
#descriptive statistic
summary(newdata) #it shows statistics



install.packages("psych")

library(psych)
describe(newdata$RPM)
#quantile
quantile(newdata$RPM, 0.01)
quantile(eurusd$HIGH, 0.05, na.rm= TRUE ) #before calculating it removed missing value

#normality check

library(tseries)
install.packages("tseries")
x= newdata$RPM

Q3 = quantile(x, probs = 0.75, na.rm=TRUE )
Q1 = quantile(newdat$RPM, probs 0.25, na.rm =TRUE)
Q2= median
IRP= Q3- Q1
