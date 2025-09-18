#read data from csv file
library(readr)
CocaColaStock <- read_csv("C:/Users/Farah/Desktop/Time series/CocaColaStock.csv")
View(CocaColaStock)
#Required packages
library(tseries)
library(forecast)
library(lmtest)
library(seastests)

attach(CocaColaStock)
dataa <- as.vector(StockPrice)

#checking seasonality
kw(dataa, freq = 12) 
#our data is non seasonal data

#ploting
dataa.to.plot <- ts(dataa,frequency = 12,start = c(1970,1))
ts.plot(dataa.to.plot, main= "TS of CocaCola Stock", ylab = "Measure")
# Checking Stationarity
acf(dataa, lag.max = 30) 
pacf(dataa, lag.max = 24)

# Transforming to Stationarity

st_diff = diff(dataa, differences=1)
ts.plot(st_diff,main=  "First difference")
acf(st_diff)
pacf(st_diff)

nd_diff = diff(dataa, differences=2)
ts.plot(nd_diff,main=  "Second difference")
acf(nd_diff)
pacf(nd_diff)

# Specifying the Initial Model
Model1 = arima(dataa,order = c(0,1,1), method = c("ML"))
summary (Model1)

# Diagnosis Tests

#1 the significance of the coefficients
coeftest(Model1)    
#2 The randomness of the noise
Residuals = residuals(Model1)
acf(Residuals)
pacf(Residuals)
Box.test(Residuals,type="Ljung",lag=10,fitdf=2)
Box.test(Residuals,type="Box-Pierce",lag=10,fitdf=2)  # fitdf = p+q

#3 the accuracy measures
accuracy(Model1)                       ## the accuracy measures: MAE, RMSE, MAPE

#4 the stationarity and invertibility

#Forecasting

f=forecast(Model1, h = 20)
plot(f)


